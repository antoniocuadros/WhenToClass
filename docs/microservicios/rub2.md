# Diseño (rutas, tipos devueltos,estados), implementación y diseño por capas
## Índice
- [Diseño (rutas, tipos devueltos,estados), implementación y diseño por capas](#diseño-rutas-tipos-devueltosestados-implementación-y-diseño-por-capas)
  - [Índice](#índice)
  - [Diseño en general del API, las rutas (o tareas), tipos devueltos por las peticiones y estados devueltos por las mismas, tests.](#diseño-en-general-del-api-las-rutas-o-tareas-tipos-devueltos-por-las-peticiones-y-estados-devueltos-por-las-mismas-tests)
    - [Rutas](#rutas)
      - [Uso de nombres en vez de verbos](#uso-de-nombres-en-vez-de-verbos)
      - [Nombrar las colecciones usando nombres plurales](#nombrar-las-colecciones-usando-nombres-plurales)
      - [Utilizar el anidamiento de recursos para mostrar relaciones o jerarquías](#utilizar-el-anidamiento-de-recursos-para-mostrar-relaciones-o-jerarquías)
      - [Filtrado mediante parámetros en la petición](#filtrado-mediante-parámetros-en-la-petición)
      - [Todas las rutas de nuestra API](#todas-las-rutas-de-nuestra-api)
    - [Tipos devueltos por las peticiones](#tipos-devueltos-por-las-peticiones)
    - [Estados devueltos por las peticiones](#estados-devueltos-por-las-peticiones)
    - [Pruebas que muestran la API en funcionamiento](#pruebas-que-muestran-la-api-en-funcionamiento)
  - [Detalles sobre la implementación y diseño por capas](#detalles-sobre-la-implementación-y-diseño-por-capas)
    - [Implementación de las rutas](#implementación-de-las-rutas)
    - [Uso de plugins](#uso-de-plugins)
    - [Implementación de la funcionalidad de cada ruta definida](#implementación-de-la-funcionalidad-de-cada-ruta-definida)
      - [Variables](#variables)
      - [Funcionalidad](#funcionalidad)
    - [Diseño por capas que desacopla la lógica de negocio del API e independecia acceso a datos.](#diseño-por-capas-que-desacopla-la-lógica-de-negocio-del-api-e-independecia-acceso-a-datos)
      - [Desacoplar la lógica de negocio del API.](#desacoplar-la-lógica-de-negocio-del-api)
      - [Desacoplar la lógica del acceso a datos.](#desacoplar-la-lógica-del-acceso-a-datos)
  - [HUs que han avanzado](#hus-que-han-avanzado)

<div id='id501' />

## Diseño en general del API, las rutas (o tareas), tipos devueltos por las peticiones y estados devueltos por las mismas, tests.

<div id='id502' />

### Rutas
Uno de los primeros pasos que se deben dar a la hora de construir una API es (o al menos debería ser) pararse un momento a pensar y diseñar las rutas de nuestra API ya que constituyen una parte fundamental de la misma.

En mi caso, para diseñar las rutas de la API se han intentando seguir las buenas prácticas que he encontrado en el siguiente [enlace](https://www.merixstudio.com/blog/best-practices-rest-api-development/). Teniendo en cuenta lo que se comenta en dicho enlace, vamos a ver como se han aplicado a nuestro proyecto de cara al diseño de las rutas:

<div id='id503' />

#### Uso de nombres en vez de verbos
En una API estamos trabajando con recursos, no a acciones, debido a esto lo más recomendable es utilizar nombres para referirnos a dichos recursos ya que los identificará de mejor forma que una acción (verbo). Las acciones como tal están definidas por los propios verbos HTTP (GET, POST, PUT...).
De esta forma las rutas que encontramos en nuestra API siguen esta buena práctica y mostramos dos ejemplos (no son los únicos):

- `/grado/$ID`: Consultar (GET) un grado identificado por $ID.
- `/grado/$ID/asignatura/$ID2`: Consultar (GET) una asignatura identificada por \$ID2 de un grado identificado por $ID.

Como podemos ver, en el primer caso estamos accediendo al recurso grado tal y como indica la ruta y en el segundo caso estamos accediendo a una asignatura de un grado de forma muy intuitiva haciendo uso de nombres para acceder a los recursos.

<div id='id504' />

#### Nombrar las colecciones usando nombres plurales
Para las colecciones de recursos, lo más recomendable es utilizar nombre plurales ya que además es una forma muy intuitiva de entender a que recursos se están accediendo. En nuestra API encontramos rutas como por ejemplo:
- `/grados`: Nos permite obtener (GET) todos los grados.
- `/grado/$ID/asignaturas`: Nos permite obtener (GET) todas las asignaturas del grado identificado por $ID.

<div id='id505' />

#### Utilizar el anidamiento de recursos para mostrar relaciones o jerarquías
Los recursos con los que trabaja una API normalmente pueden presentar algún tipo de jerarquía. De esta forma, lo más recomendable es reflejar dicha jerarquía a través de la ruta. En mi caso existe la siguiente jerarquía: Una asignatura pertenece a un grado. Así, encontramos ejemplos de rutas como la siguiente:
- `/grado/$ID/asignatura/$ID2`: Consultar (GET) una asignatura identificada por \$ID2 de un grado identificado por $ID.

Podemos ver que refleja la jerarquía correctamente.

<div id='id506' />

#### Filtrado mediante parámetros en la petición
Una buena práctica consiste en filtrar colecciones o elementos de las colecciones para acceder de mejor forma a los recursos. En nuestra API encontramos rutas como:
- `/grado/$ID/asignatura/$ID2/horario?grupo=X`: que nos permite obtener el horario pero para un determinado grupo de prácticas X.


<div id='id507' />

#### Todas las rutas de nuestra API
```
/grados # Para obtener (GET) todos los grados
```

```
/grado # Añadir (POST) un grado
```

```
/grado/$ID # Eliminar (DELETE) un grado identificado por $ID
```

```
/grado/$ID # Consultar (GET) un grado identificado por $ID
```

```
/grado/$ID/asignatura/$ID2 # Consultar (GET) una asignatura identificada por $ID2 perteneciente al grado #$ID
```

```
/grado/$ID/asignatura/$ID2 # Eliminar (DELETE) una asignatura identificada por $ID2 perteneciente al grado #$ID
```

```
/grado/$ID/asignatura # Añade (POST) una asignatura al grado #$ID
```

```
/grado/$ID/asignatura/$ID2/horario?grupo=X # Consulta (GET) el horario de una asignatura de un grado para un grupo de prácticas X.
```

```
/grado/$ID/asignatura/$ID2/enlace?grupo=X # Consulta (GET) el enlace de una clase online de una asignatura de un grado para un grupo de prácticas X.
```

```
/grado/$ID/asignatura/$ID2/enlace?grupo=X # Consulta (GET) el enlace de una clase online de una asignatura de un grado para un grupo de prácticas X.
```

```
/grado/$ID/asignatura/$ID2/turno?turno=X&mes=Y # Consulta (GET) el turno de presencialidad de una asignatura de un grado para un turno X y un mes Y.
```

```
/grado/$ID/asignaturas # Obtiene (GET) todas las asignaturas de un grado identificado por $ID
```
### Tipos devueltos por las peticiones
Nuestra API siguiendo con otra de las buenas prácticas que se mencionan en el [enlace](https://www.merixstudio.com/blog/best-practices-rest-api-development/) mostrado anteriormente, se recomienda el uso de JSON. Ya que como comenta es un formato muy versátil que puede ser utilizado con facilidad por otras APIs y además entra dentro de los tipo MIME genéricos.

De esta forma nuestra API a la hora de devolver los recursos que hayan sido solicitados, hará uso del formato JSON así como para añadir datos mediante POST se envían como JSON. De esta forma en los métodos de nuestra API econtraremos siempre para las respuestas las siguientes líneas:

```
response['Content-Type'] = 'application/json'
response.write(res.to_json)
```

Donde indicamos que el tipo MIME es application/json y acto seguido se escribe en el cuerpo de la petición el recurso en formato JSON.

### Estados devueltos por las peticiones
Cuando una operación tenga éxito, se adjuntará el código de estado: 200.
Cuando una operación falle, se adjuntará el código de estado: 404.
Se hace de la siguiente forma:

Para éxito:
```
response.status = 200
                        
```
Fallo en la petición, se ha podido comunicar con el microservicio pero no existe el recurso que se está solicitando.
```
response.status = 404
```


### Pruebas que muestran la API en funcionamiento
A continuación se muestran algunos ejemplos para que se pueda comprobar que al API funciona correctamente:

Por ejemplo, obtener todos los grados, en este caso hay 1:

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/microservicios/images/1.png)

Mostramos una asignatura de dicho grado:

![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/microservicios/images/2.png)

Mostramos el horario de una asignatura:

![img3](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/microservicios/images/3.png)

Mostramos el enlace de una clase online de una asignatura:

![img4](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/microservicios/images/4.png)

## Detalles sobre la implementación y diseño por capas
Para implementar la API se ha utilizado el framework Roda tal y como se nombó en [este documento](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/microservicios/rub1.md) donde realizamos una serie de pruebas y estudio de características para llegar a elegirlo.

### Implementación de las rutas
Como ya nombramos anteriormente en dicho documento, Roda gestiona las rutas de forma jerárquica, veamos a que se refiere mostrando como están organizadas las rutas en [nuestra API](https://github.com/antoniocuadros/WhenToClass/blob/master/lib/app.rb) porque al principio puede resular complicado este diseño jerárquico (se muestra solo como se han diseñado las rutas, es decir se elimina de cada ruta su funcionalidad para entender mejor como se gestionan las rutas):

```
class App < Roda
    ####################
    #Plugins
    plugin :all_verbs #por defecto solo trae GET y POST, queremos más.
    plugin :response_request #nos permite personalizar más las respuestas
    use Rack::CustomLogger

    ####################
    #Rutas
    route do |r|

        ####################
        #Variables
        @dator = FSDator.new("data")
        @gestor = GestorGrados.new(@dator)
        @parse = Parse.new
        
        # /grados
        r.on "grados" do
            # GET /grados
            r.get do
                "Hacer algo para GET /grados"
            end
        end

        # /grado
        r.on "grado" do
            # /grado/$ID
            r.on String do |id|
                
                # Rama /grado/$ID1/asignatura/$ID2
                r.on "asignatura" do
                    r.on String do |id2|
                        # /asignatura/$ID/horario
                        r.get "horario" do
                            "Hacer algo para GET /grado/$ID1/asignatura/$ID2/horario
                        end

                        # grado/$ID1/asignatura/$ID2/enlace
                        r.get "enlace" do
                            "Hacer algo para GET /grado/$ID1/asignatura/$ID2/enlace"
                        end

                        # grado/$ID1/asignatura/$ID/turno
                        r.get "turno" do
                            "Hacer algo para GET /grado/$ID1/asignatura/$ID2/turno"
                        end
                            
                        # grado/$ID1/asignatura/$ID
                        r.get do
                           "Hacer algo para GET /grado/$ID1/asignatura/$ID2"
                        end

                        r.delete do
                            "Hacer algo para DELETE /grado/$ID1/asignatura/$ID2/horario"
                        end
                    end

                    # post /grado/$ID/asignatura
                    r.post do
                        "Hacer algo para POST /grado/$ID/asignatura"
                end

                # /grado/$ID/asignaturas
                r.get "asignaturas" do
                    "Hacer algo para GET /grado/$ID/asignaturas"
                end
                # get /grado/$ID
                r.get do
                   "Hacer algo para GET /grado/$ID"
                end

                # delelete /grado/$ID
                r.delete do
                   "Hacer algo para DELETE /grado/$ID"
                end

            end
            # post /grado
            r.post do
                "Hacer algo para POST /grado"
            end
        end
    end
end

```

Si nos fijamos es sencillo si se ve como una estructura jerárquica y para comprenderlo de mejor forma podemos compararlo con la siguiente figura que representa de forma gráfica la jerarquía anterior:

![img5](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/microservicios/images/5.png)

### Uso de plugins
Como podemos ver en el código anterior, se está haciendo uso de plugins de Roda como son:
- `plugin :all_verbs`: Rpda por defecto solo trae GET y POST, necesitamos además DELETE que lo incluye este plugin.
- `plugin :response_request`: nos permite personalizar más las respuestas accediendo a los headers y códigos de estado.

### Implementación de la funcionalidad de cada ruta definida
La implementación de la funcionalidad de cada ruta puede consultarse por completo en el [siguiente enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/lib/app.rb) donde encontramos la implementación completa de la API. En este apartado se pretende explicar un ejemplo ya que el resto son análogos variando normalmente de forma única la llamada al método de la clase controladora:

Si nos fijamos en la operación GET sobre la ruta /grado/$ID:

```
    route do |r|
        ####################
        #Variables
        @dator = FSDator.new("data")
        @gestor = GestorGrados.new(@dator)
        @parse = Parse.new
        r.on "grado" do
            r.on String do |id|
                r.get do
                    begin
                        grado = @gestor.obtenerGrado(id)
                        jsongrado = @parse.gradoToJSON(grado)
                        response.status = 200
                        response['Content-Type'] = 'application/json'
                        response.write(jsongrado.to_json) 
                    rescue
                        response.status = 404
                        response['Content-Type'] = 'application/json'
                        res = {
                            "error"=>"No existe el grado"
                        }
                        response.write(res.to_json)
                    end
                    
                end
            end
        end
    end
```
#### Variables
Se utilizarán en los métodos las siguientes variables:
- `@dator = FSDator.new("data")`: define un acceso a datos concreto, se explicará más adelante.
- `@gestor = GestorGrados.new(@dator)`: clase controladora que contiene métodos para procesar las solicitudes que se mandan y devolver la información pedida.
- `@parse = Parse.new`: una clase que nos ayuda a pasar de objetos de nuestras clases a JSON y viceversa.

#### Funcionalidad
Como hemos mencionado, el fragmento anterior de código corresponde a la operación GET sobre la ruta /grado/$ID y hace lo siguiente:
- En primer lugar se obtiene el grado que se esá buscando gracias al método de nuestra clase controladora obtenerGrado(id). Esto nos lo devuelve como un objeto.
- En segundo lugar se convierte a JSON haciendo uso del método gradoToJSON(grado) de nuestra clase Parse.
- Se prepara la respuesta que será enviada:
  - `response.status = 200`: la operación ha sido exitosa.
  - `response['Content-Type'] = 'application/json'`: cabecera indicando que devolvemos un JSON.
  - `response.write(jsongrado.to_json) `: escribimos en el cuerpo de la respuesta el recurso solicitado, en este caso el grado en formato JSON.

Esto se encuentra dentro de un bloque begin para que en caso de que ocurra alguna excepción de las que hemos incluido en los métodos que son llamados poder controlarla, de esta forma tenemos también el bloque rescue que en caso de que haya una excepción en el bloque previo, devolverá un error de la forma correspondiente:

```
response.status = 404
response['Content-Type'] = 'application/json'
res = {
    "error"=>"No existe el grado"
}
response.write(res.to_json)
```

Esta forma de proceder es análogo al resto de rutas cambiando normalmente el método al que se llama de la clase controladora ya que esta se encarga prácticamente de todo para dotar de independencia a nuestra API.
Esta clase tendrá métodos para satisfacer cada operación necesaria, de esta forma la API en si logra la independencia de la lógica que es lo que buscamos.


### Diseño por capas que desacopla la lógica de negocio del API e independecia acceso a datos.
Es muy importante a la hora de desarrollar una API conseguir desacoplar la lógica de negocio de la propia API. Esto lo hemos conseguido en nuestra aplicación refactorizando la clase GestorGrados y además también se ha implementado persistencia intentando seguir las mejores prácticas que nos indican que debemos seguir los principios de "inyección de dependencias" y "single source of truth". Todo esto se comenta a continuación:

#### Desacoplar la lógica de negocio del API.
Para conseguir desacoplar la lógica de negocio del API, se ha refactorizado la clase [GestorGrados](https://github.com/antoniocuadros/WhenToClass/blob/master/lib/gestorgrados.rb) que ahora hace de clase controladora. Esta clase contiene todos los métodos que serán llamados desde la API sin tener que la API hacer mayor trabajo. Gracias a esta clase conseguimos que la API unicamente llame a los métodos de esta clase controladora y pueden sen modificados los métodos de esta clase controladora para adaptarse a cambios necesarios sin tener que hacer cambios en el fichero donde se encuentra la API. Esto es una gran ventaja ya que conseguimos independizar la API de la lógica de negocio.
Así la clase controladora tendrá métodos para satisfacer las diferentes peticiones que le lleguen a la API mediante métodos como:
- `obtenerGrado(grado_id)`: Obtiene un determinado grado dado un ID, lo devuelve.
- `anadirGrado(grado)`: añade un grado.
- `eliminarGrado(grado_id)`: elimina el grado identificado por un ID.
- `todosGrados()`: obtiene todos los grados.
- `eliminaAsignatura(grado_id, asignatura_id)`: elimina una asignatura de un grado.
- `añadeAsignatura(grado_id, asignatura)`: añade una asignatura a un grado.
- `obtenerAsignatura(grado_id, asignatura_id)`: obtiene una asignatura de un grado.
- `todasAsignaturas(grado_id)`: obtiene todas las asignaturas de un grado.
- `horarioAsignatura(grado_id, asignatura_id, grupo)`: obtiene el horario de una asignatura de un grado.
- `enlacesAsignatura(grado_id, asignatura_id, grupo)`: obtiene el enlace de una clase online de una asignatura de un grado.
- `turnosAsignatura(grado_id, asignatura_id, turno, mes)`: obtiene los turnos de presencialidad de una clase online de una asignatura de un grado.

Además siguiendo con las buenas prácticas que llevamos hasta ahora, se han escrito los tests para esta clase y se pueden consultar [aquí](https://github.com/antoniocuadros/WhenToClass/blob/master/t/TestGestorGrados.rb).

#### Desacoplar la lógica del acceso a datos.
Desacoplar la lógica del acceso a los datos es también muy importante y se ha tenido en cuenta en esta entrega ya que se ha decicido implementar persistencia de datos. Cuando queremos implementar persistencia es muy importante seguir los dos principios que hemos seguido:
- Inyección de dependencias: se inyecta una dependencia, en nuestro caso se verá que para crear un objeto de la clase controladora, es necesario "inyectarle" el objeto que accede a los datos.
- Única fuente de verdad: Dicho objeto que es inyectado será el único que acceda a los datos.

Para llevar a cabo todo esto, se han creado las siguientes clases:
- [Dator](https://github.com/antoniocuadros/WhenToClass/blob/master/lib/Dator.rb): clase "abstracta" (no permite instanciarse) que define los métodos que deben implementar las clases que implementen dicha clase. Define métodos de acceso a datos de forma general sin ofrecer ninguna implementación. Además se ha creado su fichero para tests y se puede consultar [aquí](https://github.com/antoniocuadros/WhenToClass/blob/master/t/TestDator.rb).
- [FSDator](https://github.com/antoniocuadros/WhenToClass/blob/master/lib/FSDator.rb): Clase que implementa los métodos de Dator (hereda de dicha clase) para gestionar los datos que se encontrarán en diversas carpetas (una carpeta por cada grado). Gestiona el acceso a dichas carpetas y ficheros para extraer, añadir, eliminar o consultar información. Además se ha creado su fichero para tests y se puede consultar [aquí](https://github.com/antoniocuadros/WhenToClass/blob/master/t/TestFSDator.rb).
- [Parse](https://github.com/antoniocuadros/WhenToClass/blob/master/lib/parse.rb) Una sencilla clase auxiliar que nos permitirá convertir objetos de nuestras clases en JSON y viceversa Usado por FSDator para el acceso a los datos. Además se ha creado su fichero para tests y se puede consultar [aquí](https://github.com/antoniocuadros/WhenToClass/blob/master/t/TestParse.rb).

De esta forma se consiguen los dos principios nombrado más concretamente de la siguiente forma:
- Inyección de dependencias: Se inyecta una dependencia de datos a la hora de crear un objeto de la clase controladora, de esta forma, el constructor de dicha clase es como sigue:
  ```
    def initialize(_dator)
       @dator = _dator
    end
  ```
  Así podemos pasarle distintas clases que hereden de Dator y que trabajen de formas muy diferenctes sin tener que modificar nada de la lógica de negocio.
  De esta forma un método de la clase controladora tendrá siempre la forma:
  ```
  ...
    @dator.metodo()
  ...
  ```

- Única fuente de verdad: Se cumple ya que como ya hemos dicho, el objeto que es inyectado es el unico que accederá a los datos.

## HUs que han avanzado
Para la creación de la API han avanzado las diversas HUs que tienen que ver con las funcionalidades que se han ido implementando a través de las rutas como pueden ser:
- [[HU1] Como usuario, quiero obtener el horario de teoría y prácticas de una asignatura dado un grupo de prácticas y obtenerlo en orden de lunes a viernes](https://github.com/antoniocuadros/WhenToClass/issues/8)
- [[HU2] Como usuario, quiero poder consultar los turnos de presencialidad de un mes determinado y grupo de presencialidad de una asignatura.](https://github.com/antoniocuadros/WhenToClass/issues/9)
- [[HU4] Como usuario debo poder seleccionar, añadir y eliminar una asignatura](https://github.com/antoniocuadros/WhenToClass/issues/28)
- [[HU6] Como usuario quiero poder obtener los enlaces de las clases online de una determinada asignatura](https://github.com/antoniocuadros/WhenToClass/issues/47)
- [[HU10] Como administrador de una universidad tendría que poder añadir, eliminar grados y consultarlos](https://github.com/antoniocuadros/WhenToClass/issues/71)

Además se ha creado la siguiente HU con el objetivo de conseguir implementar correctamente la pesistencia de datos y su acceso:
- [[HU12] Como desarrollador quiero una jerarquía de clases que me permita gestionar datos adecuadamente](https://github.com/antoniocuadros/WhenToClass/issues/89)

Para implementar el sistema de Logs a través de un middleware se ha creado la siguiente:
- [[HU13] Como desarrollador me gustaría tener un sistema de logs para el microservicio](https://github.com/antoniocuadros/WhenToClass/issues/93)

Para añadir configuración distribuida:
- [[HU14] Como administrador del microservicio tendría que disponer de un sistema de configuración distribuida](https://github.com/antoniocuadros/WhenToClass/issues/94)

No se han cerrado estas dos últimas HUs ya que en un futuro pueden ser continuadas para añadir mejoras.