# Uso de buenas prácticas: configuración distribuida, logs, uso de middleware.
## Configuración distribuida.
Se ha hecho uso de configuración distribuida en nuestra aplicación en el fichero que se encargará de arrancar la aplicación y establecer ciertas configuraciones, en nuestro caso se ha utilizado para una tarea muy sencilla, establecer el puerto en el que se ejecutará la aplicación en el fichero [config.ru](https://github.com/antoniocuadros/WhenToClass/blob/master/config.ru).

Para lograr esto, necesitamos tener instalado `etcd` en nuestro sistema, exportar lo siguiente: `export ETCDCTL_API=3` para que funcione correctamente el cliente.

Una vez hecho esto, ya podemos almacenar el valor del puerto de la siguiente forma:
`
etcdctl put /node/port 9777
`
Ahora en el lado de la aplicación necesitamos instalar la gema `etcd` que se ha añadido al GemFile y en el [fichero donde se vaya a hacer uso de configuración distribuida](https://github.com/antoniocuadros/WhenToClass/blob/master/config.ru) hacer `require "etcd"`. Y se ha puesto lo siguiente dentro del fichero:

```
require "etcd"
require "./lib/app" #fichero de la api

#nos conectamos a etcd
begin
    client = Etcd.client(host: '127.0.0.1', port: 2379)

    # Get
    port = client.get('/nodes/port').value
rescue
    port = "9898" #Por defecto de Rack
end


Rack::Handler.default.run(App, :Port => port)
```

Como vemos creamos un cliente y posteriormente se obtiene el puerto y es usado por Rack para iniciar la aplicación en dicho puerto.

Cuando hacemos Rackup vemos que se ejecuta en el puerto que hemos establecido anteriormente:
```
[2020-12-08 20:29:25] INFO  WEBrick 1.6.0
[2020-12-08 20:29:25] INFO  ruby 2.7.0 (2019-12-25) [x86_64-linux-gnu]
[2020-12-08 20:29:25] INFO  WEBrick::HTTPServer#start: pid=75074 port=9777
```

Es un ejemplo muy sencillo de como utilizar configuración distribuida. Aunque quizás se le saque más provecho cuando se disponga de múltiples microservicios por ejemplo y todos tengan una base de datos en común (por ejemplo) y gracias a esto pudiésemos cambiar la ruta a la base de datos con un simple comando en la consola.

Se ha consultado la [siguiente documentación](https://github.com/ranjib/etcd-ruby) de etcd-ruby para poder trabajar con dicha gema.

--NOTA--
Anteriormente se estaba usado la gema `etcdv3` pero a la hora de ejercutar la tarea `rake start` en el dockerfile si no definías la variable entraba en un bucle infinito en vez de saltar una excepción de tal manera que era imposible de tratar en un bucle `begin ... rescue ... end`. Debido a esto se ha utilizado la gema `etcd` que si trata con excepciones y de esta forma, si no está establecida la clave /nodes/port coge el puerto por defecto de Rack que es el 9898.

## Logs y middleware
Para esta parte, se ha programado un middleware que se encargue de gestionar los logs. Como ya sabemos un middleware es como un hook o una llamada que se produce antes o después de la activación de una ruta, en nuestro caso, se ejecutará después de la activación de la ruta.

Para ello hemos creado la clase [CustomLogger](https://github.com/antoniocuadros/WhenToClass/blob/master/lib/middleware.rb).

En dicha clase podemos ver que se ha creado un nuevo módulo de rack (metiendo el código entre `module Rack ... end` lo que nos permitirá utilizarlo en nuestra API de forma sencilla). De esta forma este middleware es la siguiente:

```
require 'rack'
require 'fileutils'

module Rack    
    class CustomLogger
        def initialize(app)
            @app = app
        end
        def call(env)
            status, headers, body = @app.call(env)
          
            fecha = Time.now.strftime("%d_%m_%Y")
            ruta = "logs/log" + fecha.to_s + ".txt"

            if (! Dir.exist?("logs")) 
                FileUtils.mkdir("logs")
            end
            if ( ! ::File.exist?(ruta) )
                FileUtils.touch(ruta)
            end

            if !env[QUERY_STRING].empty?
                query_s = "?" + env[QUERY_STRING]
            else
                query_s = ""
            end
            hora = Time.now.strftime("%H:%M:%S")

            a_anadir = hora + " " + env[REQUEST_METHOD].to_s + " " + env[PATH_INFO].to_s + query_s + " " + env[SERVER_PROTOCOL].to_s + " " + status.to_s[0..3]

            ::File.open(ruta, "a") { |file| file.puts a_anadir}

            #Enviamos la respuesta
            [status, headers, body]
        end
    end
end
```

Como vemos tenemos un único método call que es un método necesario al crear una aplicación Rack como es el middleware que estamos creando. Dicha función será activada cada vez que haya una petición a la API.

En dicha función podemos ver que se hace lo siguiente:
- Obtenemos status, headers, body de la respuesta a la llamada al método de la API ya que como hemos dicho antes, este middleware se ejecuta tras la activación de la ruta
- Se obtiene la fecha en formato dia_mes_año.
- Si no existe la carpeta logs, se crea.
- Si no existe el archivo cuyo nombre es log + fecha (anteriormente obtenida), se crea.
- Si hay parámetros en la ruta se obtienen a través de env[QUERY_STRING], (env es una variable que contiene información de la petición realizada).
- Se obtiene otra información como el método HTTP utilizado, la ruta activada, la versión de HTTP utilizada y el código de estado.
- Todo ello es juntado en una única cadena junto con la hora y se añaden al fichero anteriormente mencionado.
- Devolvemos status, headers, body que obtuvimos al principio.

Como vemos implementa una funcionalidad de log muy sencilla que nos permite tener un archivo de log para cada día diferente dentro de una carpeta "log".
Ahora simplemente añadiendo `use Rack::CustomLogger` nuestra aplicación construida con Roda utilizará dicho middleware (e importando el archivo que lo contiene `require_relative "middleware"`).

## Gestión de errores
En cada método se contempla que pueden haber errores, debido a esto cada bloque de código trata las excepciones con bloques `begin ... rescue ... end` de tal manera que cuando salte una excepción en el bloque begin, saltará al rescue devolviendo un mensaje de error informativo en formato JSON descriptivo del problema y un código de estado 404 de la siguiente forma:

```
begin
    ...
rescue 
    response.status = 404
        response['Content-Type'] = 'application/json'
        res = {
            "error"=>"No se ha encontrado el grado o asignatura"
        }
    response.write(res.to_json)  
end
```