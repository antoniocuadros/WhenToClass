# Justificación técnica del framework elegido para el microservicio
En este apartado se van a realizar diversos benchmarks sobre pequeños microservicios haciendo uso de distintos frameworks. Además expondremos en un segundo apartado las características más destacadas de cada uno. Todo esto nos permitirá hacernos una idea general de los frameworks más destacados que encontramos actualmente y poder decidirnos eligiendo uno de ellos para la creación del microservicio.

## Frameworks que se van a poner a prueba
Haciendo una búsqueda de los frameworks que más nos pueden servir para llevar a cabo la tarea de construir un servicio en Ruby y que más se adecúan a lo que queremos llevar a cabo he encontrado:
- [Cuba](https://cuba.is/): Documentación oficial disponible [aquí](https://github.com/soveran/cuba#cuba).
- [Sinatra](http://sinatrarb.com/): Documentación oficial disponible [aquí]().
- [Hanami](https://hanamirb.org/): Documentación oficial disponible [aquí](http://sinatrarb.com/documentation.html).
- [Roda](https://github.com/jeremyevans/roda): Documentación oficial disponible [aquí](https://github.com/jeremyevans/roda).

Los códigos utilizados se proporcionan en el apartado final del documento.



## Primera parte: Benchmarks.
Se utilizará para los benchmarks Apache Benchmark en su versión 2.3. Cada microservicio para poder hacer benchmarks los más significativos posible ejecutarán el mismo tipo de código, simplemente devolverán un `Hello World!`.
Esta herramienta nos permitirá obtener de forma sencilla diversas métricas de nuestro microservicio como puede ser el tiempo por petición, tasa de transferencia, tiempo de conexión, etc.
Se ha utilizado la siguiente orden:

```
ab  -n1000 -c100 http://localhost:9292/
```
Parámetros utilizados:
- -n: Total de peticiones que se van a realizar al sitio, en este caso 1000 peticiones. 
- -c: Parámetro que indica la cantidad de conexiones concurrentes, en este caso 100.


Se han realizado tres benchmarks sobre cada microservicio y en el siguiente apartado se muestran los resultados de todas la ejecuciones y finalmente las medias de la ejecución de dichos benchmarks sobre cada microservicio.


### Resultados
#### Cuba
|Número Benchmark |  Tiempo por petición (ms) | Tasa de transferencia (KB/sec) | Tiempo de conexión (ms) | Peticiones por segundo |
|---              |---                        |---                             |---                      |---                     |               
| 1               | 102.958| 375.61 | 86.5 | 960.21 |
| 2               | 99.187 | 400.72 | 73.6 | 1008.20 |
| 3               | 99.307 | 430.59 | 65.4 | 1083.34 |
| media           | 100.484 | 402.306 | 75.16 | 1017.25 |


#### Hanami
|Número Benchmark |  Tiempo por petición (ms) | Tasa de transferencia (KB/sec) | Tiempo de conexión (ms) |  Peticiones por segundo |
|---              |---                    |---                    |---                 |--- |
| 1               | 82.461 | 217.91 | 60.3 | 1212.69 |
| 2               | 84.92 | 211.58  | 59.9 | 1177.49 |
| 3               | 82.280 | 218.38 | 48.1 | 1215.36 |
| media           | 83.220 | 215.956 | 56.1 | 1201.846 |

#### Sinatra
|Número Benchmark |  Tiempo por petición (ms) | Tasa de transferencia (KB/sec) | Tiempo de conexión (ms) | Peticiones por segundo |
|---              |---                    |---                    |---                 |--- |
| 1               | 99.585 | 287.32 | 75.7 | 1004.16 |
| 2               | 102.224 | 279.91 | 68.7 | 978.25 |
| 3               | 102.531 | 279.07 | 70.2 | 975.32 |
| media           | 101.446 | 282.1 | 214.6 | 985.91 |

#### Roda
|Número Benchmark |  Tiempo por petición (ms) | Tasa de transferencia (KB/sec) | Tiempo de conexión (ms) | Peticiones por segundo |
|---              |---                    |---                    |---                 |--- |
| 1               | 87.449 | 197.66 | 56.5 | 1143.52 |
| 2               | 86.845 | 199.03 | 47.6 | 1151.48 |
| 3               | 84.317 | 205.00 | 47.0 | 1186.00 |
| media           | 86.203 | 200.56 | 50.36| 1160.3  |

#### Comparación
| Framework |  Tiempo por petición (ms) | Tasa de transferencia (KB/sec) | Tiempo de conexión (ms) |  Peticiones por segundo |
|---              |---                    |---                    |---                 |---  |
| Cuba       | 100.484 | 402.306 | 75.16 | 1017.25 |
| Hanami     | 83.220 | 215.956 | 56.1 | 1201.846 |
| Sinatra    | 101.446 | 282.1 | 214.6 | 985.91 |
| Roda       | 86.203 | 200.56 | 50.36 | 1160.3 |


Si plasmamos los resultados sobre un gráfico para una mejor interpretación obtenemos lo siguiente:

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/microservicios/images/grafico.png)


En cuanto al **tiempo por petición**, como ya sabemos, cuanto menor sea el valor mejor, de esta forma encontramos que no existen muchas diferencias. El que menor tiempo por petición tiene es tanto Roda como Hanami. En caso opuesto, el que más tarda en sevir una petición es Sinatra.


Si nos fijamos ahora en la **tasa de transferencia**, en este caso, cuanto mayor sea mejor. De esta forma el que mejor tasa de transferencia tienen es Hanani mientras que el que tiene menor tasa de transferencia es Roda. 


En cuanto al **tiempo de conexión**, cuanto menor sea este valor mejor. El mejor en este aspecto es Roda y el que mayor tiempo de conexión tiene con mucha diferencia es Sinatra que es 4,28 veces mayor que el tiempo de conexión de Roda.


Por último encontramos el **número de peticiones que se sirven por segundo**, esta cantidad cuanto mayor sea mejor. Como vemos otra vez más Sinatra es el que peor sale parado mientras que tanto Hanami como Roda son los mejores sirviendo peticiones por segundo.


De esta forma vemos que en cuestiones de rendimiento, en líneas generales, las mejores opciones son tanto Hanami como Roda, según los benchmarks que hemos realizado.


## ¿Que nos ofrece cada Framework?
A continuación se ofrece una visión general de lo que ofrece cada framework:
### Cuba
Cuba es un sencillo microframework para Ruby, puede encontrarse la documentación oficial en el propio [repositorio oficial](https://github.com/soveran/cuba#cuba).
Ofrece lo siguiente:
- Sencilla gestión de rutas.
- Sencilla forma de realizar tests usando `require "cuba/test"`.
- Uso de matchers para aceptar cadenas mediante expresiones regulares.
- Uso de códigos de estado por defecto. Si se accede a una ruta que no existe el código será 404, si existe se devolverá 200.
- Seguridad: se puede hacer `require "cuba/safe"` para hacer uso de https.
- Están disponibles los siguientes verbos http: get, post, put, patch, delete, head, options, link, unlink y trace. 
- Asignación de cabeceras con `req.headers`.
- Manejo sencillo de peticiones y respuestas con 
  - Cuba.settings[:req] = MyRequest
  - Cuba.settings[:res] = MyResponse
- Uso de middlewares: `API.use SomeMiddleware`

### Sinatra
Sinatra es otro sencillo microframework y podemos encontrar la documentación en el [siguiente enlace](http://sinatrarb.com/documentation.html).
- Manejo sencillo de rutas.
- Manejo sencillo de cabeceras y códigos de estado.
- Disponibles los métodos básicos http.
- Control de caché.
- Se puede acceder a la petición mediante el objeto request.
- Uso de variables de entorno.
- Control de errores sencillo.
- Compatibilidad de middlewares.
- Realización de tests de forma sencilla importando `require 'rack/test'`.
- Compatible con un estilo modular de aplicaciones.
- Código muy legible.
  
### Hanami
Hanami es otro microframework muy sencillo, podemos encontrar su documentación en el [siguiente enlace](https://guides.hanamirb.org/introduction/getting-started/) y asegura ser muy rápido gestionando tiempos de respuesta, concuerda con lo que hemos visto en el apartado donde hemos hecho los benchmarks, además asegura que usa un 60% menos de memoria que otros full-featured Ruby frameworks.
- Sintaxis clara para gestionar rutas.
- Sencilla gestión de códgios de estado y respuestas.
- Uso de expresiones regulares.
- Permite los verbos http: get, post, delete, patch.
- Pruebas haciendo uso de Rspec con la clase Web.routes. (Inconveniente, ya que yo uso minitest).
- Control de errores.
- Objeto para petición `request` y función para response `call()`.
- Cacheo HTTP.


### Roda
Roda destaca en su [página web oficial](http://roda.jeremyevans.net/) los siguientes aspectos:
- Gran cantidad de plugins.
- Arquitectura flexible.
- Enfocado a la seguridad.
- Simple y fiable.
- Gran cantidad de documentación.
Además podemos ver que ofrece lo siguiente en la [documentación](https://fiachetti.gitlab.io/mastering-roda/):
- Gestión jerárquica de rutas (lo hace diferente del resto y quizás más legible).
- Como se ha mencionado anteriormente, una gran cantidad de plugins que permiten realizar una gran cantidad de acciones como cacheo, uso de middlewares, sistema de logs... (Muy útil para nuestra aplicación).
- Uso de expresiones regulares entre otros matchers (ofrece una gran cantidad de ellos).
- Gestión de respuesta con el objeto `response` que nos permite manejar también de forma sencilla los códigos de estado devueltos.
- Control de los datos pasados en la petición de forma sencilla.
- Uso de middleware de forma sencilla.
- Control de errores.
- Permite el uso de los verbos http más comunes.
- Realización de pruebas importando `'rack/test'`. 
- JSON plugin para gestionar respuestas de forma sencilla.

## Conclusión
Para la realización del microservicio se va a utilizar Roda ya que como hemos visto, es uno de los más eficientes en las comparaciones de rendimiento que hemos realizado en los apartados superiores. Además de su gran rendimiento, ofrece una sintaxis muy sencilla y una gran cantidad de pluggins que nos permiten aumentar la funcionalidad de nuestro microservicio de forma sencilla. Ofrece una forma sencilla de poner a punto un microservicio así como su testeo. En cuanto a gestión de peticiones y respuestas es muy flexible y permite modificar y recuperar todo lo necesario de forma muy sencilla. La gestión jerárquica de rutas me ha parecido muy interesante ya que desde mi punto de vista da mucha legibilidad y seguimiento al código escrito. Gracias a esto y a todo lo mencionado en temas de rendimiento en el primer apartado de pruebas y en el segundo de características de Roda se ha decidido hacer uso de este (micro)framework.











## Microservicios que se han puesto a prueba
### Microservicio con Cuba
El código creado ha sido el siguiente:

```
require "cuba"

Cuba.define do
  on get do
    on "hello" do
      res.write "Hello world!"
    end

    on root do
      res.redirect "/hello"
    end
  end
end
```


### Microservicio con Sinatra
El código creado ha sido el siguiente:

```
require "sinatra/base"

class HelloWorld < Sinatra::Base
  get "/" do
    "Hello World!"
  end
end
```

### Microservicio con Hanami
El código creado ha sido el siguiente:

```
require "hanami/router"

APP = Hanami::Router.new do
  get "/", to: ->(env) { [200, {"Content-Type" => "text/html"}, ["Hello World!"]] }
end
```

### Microservicio con Roda
El código creado ha sido el siguiente:

```
require "roda"

class App < Roda
  route do |r|
    r.root do
      r.redirect "/hello"
    end

    r.on "hello" do
      @saludo = 'Hello World!'

      r.is do
        r.get do
          "#{@saludo}!"
        end
      end
    end
  end
end
```