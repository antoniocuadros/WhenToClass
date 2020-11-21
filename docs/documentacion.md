# Documentación del proyecto
## Índice
1. ¿Qué problema se pretende resolver?
   1. Motivación
2. Herramientas
   1. Gestor de versiones
   2. Herramienta de pruebas
   3. Herramienta de gestión de dependencias
   4. Framework para aplicaciones web
   5. Herramienta de gestión de tareas
3. Tests unitarios
4. Docker
   1. Buenas prácticas llevadas a cabo para escribir el Dockerfile para ejecución de tests en Ruby
   2. Contenedor subido a Docker Hub y configuración de la automatización
      1. Repositorio creado y enlazado con repositorio GitHub
      2. Configuración de la automatización
         1. En GitHub
         2. En Docker Hub
         3. Automatización funcionando
   3. Como ejecutar los tests en el contenedor
      1. Ejemplo
         1. Descargando la imagen desde Docker Hub.
         2. Descargando la imagen desde Github Container Registry.
   4. Subir contenedor a Github Container Registry
   5. Posibilidades de elección como imagen base
   6. Decisión imagen base: Pruebas rendimiento y almacenamiento imágenes base para Ruby
   7. Optimización de la imagen resultante
5. Integración continua
   1. Buenas prácticas a seguir con Travis debido al sistema de créditos
   2. Travis
   3. Circle CI
   4. Aprovechamiento del contenedor en sistemas de Integración Continua
   5. Uso del gestor de tareas en Integración Continua


## :notebook: ¿Qué problema se pretende resolver?
Con este proyecto se pretende dar solución a un problema al que nos enfrentamos en la actualidad los estudiantes de Ingeniería Informática, este problema consiste en saber qué días debemos ir a clases y a qué horas a cada una de las asignaturas debido a la semipresencialidad con la que nos encontramos debido a la situación actual.
Así se pretende crear un microservicio REST que permita responder a las siguientes preguntas muy frecuentes entre los estudiantes hoy en día sobre cada asignatura:
- ¿Qué horario tiene la asignatura "X"?
- ¿Qué días tengo que ir si soy del turno de presencialidad "Y" de la asignatura "X"?

### Motivación
Como ya se ha comentado anteriormente, en la actualidad los estudiantes de Informática nos encontramos con constantes dudas relacionadas con qué días debemos acudir a una determinada asignatura debido a la semipresencialidad que nos encontramos debido a la situación presente. Debido a esto se pretende elaborar un microservicio REST que permita a los usuarios consultar el horario de ciertas asignaturas tanto de teoría como de prácticas, así como saber que días les corresponde ir pudiendo consultar la lista de días asignados en función del turno de presencialidad al que pertenecen.

## :wrench: Herramientas
- **Lenguaje de programación:** Se utilizará Ruby como lenguaje de programación debido a que lo he usado en otras asignaturas, me parece muy útil y me gustaría seguir profundizando en él.
- **Base de datos:** La aplicación deberá obtener la información solicitada por los usuario de una determinada base de datos que puede ser tanto local (haciendo uso de ficheros JSON) como remota haciendo uso de bases de datos relacionales o no relacionales como MongoDB en este último caso.
- **Sistema de logs:** Tal y como se menciona [aquí](https://jj.github.io/curso-tdd/temas/servicios.html) el sistema de logs es uno de los servicios más importantes ya que nos permite registrar los eventos que ocurren para posteriormente analizarlos en busca de problemas tanto del servicio en sí como de prestaciones y otros muchos más aspectos.

### Gestor de versiones
#### rbenv
Para la realización de este proyecto se está utilizando el gestor de versiones RBENV, podemos consultar la página oficial de este manejador de versiones en este [enlace](https://github.com/rbenv/rbenv) que nos lleva a su repositorio oficial apoyado por la comunidad.
RBENV nos permite implementar cada proyecto con nuestro entorno totalmente autónomo pudiendo elegir una versión específica de Ruby y las gemas necesarias para ejecutar nuestra aplicación, a diferencia de rvm, rbenv es bastante más ligero y aborda una mayor cantidad de versiones de este lenguaje así como permite cambiar la configuración global de Ruby por cada usuario.

##### ¿Por qué rbenv?
Se ha elegido como gestor de versiones rbenv ya que aporta una gran flexibilidad, mayor incluso que rvm manejando las distintas versiones del lenguaje Ruby y además de una forma más sencilla a como se hace con rvm. Por otra parte presenta una serie de ventajas (frente a rvm) como:
- No necesita cargarse en la shell.
- No existe un fichero de configuración ya que lo único que nos interesa es con qué versión de Ruby queremos trabajar, haciendo su uso mucho más sencillo.
- Mucho más ligero.
- Simplicidad y facilidad de uso.

Se descartó el uso de RVM por las ventajas comentadas de rbenv, podemos consultar información de RVM  [aquí](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Herramientas/rvm.md).
### Herramienta de pruebas
#### minitest
Para la realización de este proyecto se utiliza como herramienta para realizar las pruebas del código la herramienta minitest. Esta herramienta es la evolución de unit/test que incluye más funcionalidades como por ejemplo Mocks. Es una herramienta escrita en Ruby para probar código escrito en este mismo lenguaje. Permite realizar lo que se conoce como pruebas unitarias, es decir, probar clases y métodos al igual que RSPEC. Además minitest continúa evolucionando gracias a los aportes de la comunidad y el trabajo de cientos de colaboradores. Se puede consultar el repositorio oficial [aquí](https://github.com/seattlerb/minitest).
##### ¿Por qué minitest?
Se ha elegido debido a que es una herramienta muy sencilla con una sintaxis también muy sencilla ya que todo se escribe como si fuese una clase de Ruby con sus métodos, donde cada método es un test. En cuanto a la documentación a diferencia de RSPEC, he sido capaz de encontrar una mayor cantidad de [documentación](http://docs.seattlerb.org/minitest/Minitest/Assertions.html) y la curva de aprendizaje ha sido mucho menor al tener una sintaxis muy intuitiva y limpia ya que es simplemente Ruby. Además no genera ficheros a diferencia de RSPEC que genera una carpeta y además un fichero dentro de esa carpeta con código que cuesta encontrar para lo que sirve en la documentación oficial, minitest no nos genera en nuestro directorio ningún fichero, sólo debemos empezar a escribir tests.
Además, minitest es mucho más rápido ejecutando tests e incluye el uso de fixtures sin tener que instalar nada más.

Se descartó el uso de RSpec por las ventajas comentadas anteriormente, no obstante, podemos consultar información del mismo [aquí](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Herramientas/rspec.md)
### Herramienta de gestión de dependencias
#### Bundler
Para la realización de este proyecto se está utilizando como herramienta de gestión de dependencias (en el caso de Ruby son conocidas como gemas) Bundler. Es una herramienta que permite realizar un seguimiento de las gemas así como su instalación. Es un proyecto apoyado por la comunidad que realiza aportaciones a su [repositorio oficial](https://github.com/rubygems/rubygems/tree/master/bundler) de forma constante para mejorarlo de forma continuada. Dada una lista de gemas, Bundler puede tanto descargarlas como instalarlas así como otras gemas necesarias para las gemas que se han indicado. Además proporciona facilidades para actualizar las gemas instaladas y registra las versiones que se encuentran instaladas.
##### ¿Por qué Bundler?
Se ha elegido Bundler debido a que es una herramienta muy extendida en lo que a desarrollo en Ruby se refiere debido a su sencillez de utilización e instalación así como debido a la gran cantidad de documentación existente sobre Bundler y todas las ventajas mencionadas en el apartado anterior, ya que aporta una gran flexibilidad gracias a todas las opciones comentadas.
### Framework para aplicaciones web
Se utilizará debido a la baja complejidad del proyecto un framework sencillo, como por ejemplo es el caso de [Sinatra](http://sinatrarb.com/) que se describe así mismo como "Sinatra is a DSL for quickly creating web applications in Ruby with minimal effort" y además posee una gran cantidad de documentación tanto [oficial](http://sinatrarb.com/documentation.html) como por parte de la comunidad.

### Herramienta de gestión de tareas
#### Rake
Para la realización de este proyecto se está utilizando como herramienta de automatización rake. Rake en la actualidad se ha convertido en un estándar como herramienta de construcción para Ruby y es muy popular entre toda la comunidad. Es un proyecto apoyado por la comunidad que colabora activamente en su constante evolución, se puede consultar el repositorio oficial [aquí](https://github.com/ruby/rake).
##### ¿Por qué Rake?
Se ha elegido rake debido a que es una herramienta muy potente para trabajar con Ruby y además está escrito también en este lenguaje.  Además es muy útil ya que permite especificar tareas con requisitos previos y además que la sintaxis sea la estándar de Ruby hace que sea muy sencillo de utilizar y aprender. Por otra parte, cuenta con una gran cantidad de documentación lo que facilita el aprendizaje y su uso. De esta forma rake es una herramienta muy potente para Ruby ya que nos permite automatizar todas las tareas que necesitemos.

## Tests unitarios
A continuación se muestran capturas de pantalla que muestran el correcto funcionamiento de los tests, siendo ejecutados con la herramienta rake.

Si queremos saber que tests tenemos preparados para ejecutar debemos hacer:

`rake --tasks`

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/tests/Im%C3%A1genes/tests0.png)

y debemos fijarnos aquellos en los que indica "Run tests". Como podemos ver tenemos dos conjuntos de tests:
 - testunitariosasignaturas: que ejecutará los tests de la clase Asignatura.
 - testunitariosgestorasignaturas: que ejecutará los tests de la clase GestorAsignaturas.

Para ejecutar cada una de estos conjuntos de tests podemos hacer:

- `rake testunitariosasignaturas`

 ![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/tests/Im%C3%A1genes/tests1.png)

- `rake testunitariosgestorasignaturas`

![img3](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/tests/Im%C3%A1genes/tests2.png)

Si queremos ejecutar todos haremos:

`rake test`

![img4](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/tests/Im%C3%A1genes/tests3.png)

## Docker
### Buenas prácticas llevadas a cabo para escribir el Dockerfile para ejecución de tests en Ruby
En esta sección se va a analizar el [Dockerfile](https://github.com/antoniocuadros/WhenToClass/blob/master/Dockerfile) que hemos escrito y analizaremos que buenas prácticas hemos seguido. Para documentarme acerca de las buenas prácticas a la hora de escribir Dockerfiles consulté [la siguiente página](https://lipanski.com/posts/dockerfile-ruby-best-practices). Como podemos ver, en esa página, se nos cuenta a lo largo de diversos apartados de forma muy clara que es lo que no se recomienda hacer y que debemos hacer en contraposición con una serie de ejemplos muy sencillos.

De esta forma, en mi Dockerfile podemos encontrar las siguientes buenas prácticas:
1. **Fijar la versión de la imagen base:** como podemos ver hemos especificado una versión de la imagen base, en nuestro caso: alpine:3.12.1 en vez de poner simplemente alpine ya que si hacemos esto último se nos descargará cada vez que construyamos el contenedor la última imagen de alpine y podríamos obtener fallos y no conseguiríamos el objetivo de tener un entorno reproducible.
2. **Utilizar imágenes oficiales o de confianza:** Se ha utilizado la imagen oficial de alpine que se puede encontrar en [Docker Hub](https://hub.docker.com/_/alpine).
3. **Especificar la versión de cada paquete instalado:** Con el mismo objetivo de conseguir un entorno reproducible se deben especificar las versiones de todos y cada uno de los paquetes que se van a instalar, de esta forma nuestro Dockerfile así lo hace:
   
   >RUN apk update &&\
    apk add --no-cache ruby=2.7.1-r3 \
    ruby-bundler=2.1.4-r1 \
    ruby-rake=2.7.1-r3

4. **Agrupar los comandos según la posibilidad de cambiar:** Se han puesto más arriba los comandos con menor posibilidad de cambiar y abajo los que más posibilidades de cambiar tienen.
5. **Minimizar lo máximo posible el tamaño, eligiendo una imagen base lo más pequeña posible:** Como podemos ver se ha optado por una imagen de Alpine que ofrece una imagen muy pequeña.
6. **Al configurar la instrucción CMD optar por el formato exec frente al formato shell:** Como podemos ver hemos optado por este formato porque hemos hecho:
   >CMD ["rake","test"]

### Contenedor subido a Docker Hub y configuración de la automatización

#### Repositorio creado y enlazado con repositorio GitHub
Se ha creado un repositorio en Docker Hub y se ha configurado para que se construya automáticamente cada vez que se actualiza el repositorio de GitHub.

El repositorio puede ser consultado [aquí](https://hub.docker.com/r/antoniocuadros/whentoclass).

Se muestra el repositorio de Docker Hub:

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/dockerhub/vistapublica.png)

#### Configuración de la automatización

##### En GitHub:

En la configuración de GitHub y para su actualización de forma automática en Docker Hub necesitamos un Webhook:

![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/dockerhub/webhooks.png)

##### En Docker Hub

En la configuración de Docker Hub del repositorio debemos tener lo siguiente:

![img3](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/dockerhub/auto1.png)


#### Automatización funcionando

Y de esta forma ya hemos automatizado el proceso de hacer build en DockerHub tras hacer un push en nuestro repositorio de GitHub, podemos ver a la derecha el historial de builds que se han hecho de forma automatizada, de hecho se puede ver a la derecha que justo se está haciendo una build ya que se ha hecho un push al repositorio de GitHub hace unos minutos:
![img3](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/dockerhub/auto2.png)

### Como ejecutar los tests en el contenedor
En primer lugar deberemos bajarnos el contenedor, tenemos dos posibilidades:
- Docker Hub: 
  > docker pull antoniocuadros/whentoclass
- GitHub Container Registry:
  > docker pull ghcr.io/antoniocuadros/whentoclasstests:v2

Una vez tenemos la imagen tenemos que descargarnos el [repositorio de GitHub](https://github.com/antoniocuadros/WhenToClass):
> git clone git@github.com:antoniocuadros/WhenToClass.git

Y ya podemos ejecutar los tests (ejecutar lo siguiente desde dentro de la carpeta del repositorio descargado):
>docker run -t -v \`pwd`:/test IMAGE_ID 

#### Ejemplo:
##### Descargando la imagen desde Docker Hub
![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/githubrepositoryregistry/paso1.png)

##### Descargando la imagen desde GitHub Container Registry
![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/githubrepositoryregistry/paso2.png)


### Subir contenedor a Github Container Registry
Inicialmente se subió el contenedor a Github Package Registry ya que nada más hacer click en el apartado paquetes aparecían las instrucciones para subirlo ahí, ¿el problema?, tal y como podemos ver cuando lo subimos dice que el servicio está obsoleto.


No obstante podemos ver el contenedor subido a Github Package Registry en el [siguiente enlace](https://github.com/antoniocuadros/WhenToClass/packages/471569).

Y los pasos seguidos para subir paquetes a este registro se encuentran [aquí](https://docs.github.com/es/free-pro-team@latest/packages/using-github-packages-with-your-projects-ecosystem/configuring-docker-for-use-with-github-packages) en la documentación oficial.

Investigando, me he dado cuenta que el que está activo actualmente es Github Container Registry y subí ahí mi contenedor que se puede consultar en el [siguiente enlace](https://github.com/users/antoniocuadros/packages/container/package/whentoclasstests).

A continuación se adjuntan imágenes del contenedor subido correctamente:

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/githubrepositoryregistry/vista2.png)

![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/githubrepositoryregistry/contenedor2.png)

Se han seguido los pasos encontrados en la [documentación oficial](https://docs.github.com/es/free-pro-team@latest/packages/getting-started-with-github-container-registry/migrating-to-github-container-registry-for-docker-images).


### Posibilidades de elección como imagen base
Cuando tenemos que elegir una imagen base para nuestro contenedor encontramos varias posibilidades, elegir una imagen base oficial de un determinado lenguaje, o partir de un sistema operativo como imagen base.
#### Imágenes base oficiales Ruby
En Ruby principalmente podemos encontrar tres tipos de imágenes base:
#### ruby:\<version\>
>Esta imagen es la por defecto de Ruby. Podemos encontrar etiquetas como buster o stretch que indican la versión de Debian en la que se basa la imagen. Esta imagen cuenta con una gran cantidad de paquetes muy comunes en Debian y en consecuencia tiene un peso bastante mayor.

#### ruby:\<version\>-slim
>Esta imagen no contiene los paquetes más comunes de la etiqueta por defecto comentada anteriormente. Únicamente contiene los paquetes mínimos para ejecutar Ruby.

#### ruby:\<version\>-alpine
>Esta imagen está basada en Alpine Linux. Es una imagen muy pequeña en la que únicamente se incluyen las herramientas básicas para trabajar con Ruby.

#### Usando un sistema operativo como imagen base
Existe una gran variedad sistemas operativos como imágenes base, se destaca Alpine debido a una característica principal que lo define y diferencia del resto, son imágenes muy pequeñas.
#### alpine:\<version\>
>Esta opción nos permite crear el contenedor totalmente a nuestra medida ya que partimos de un sistema operativo base como en este caso es Alpine y a partir de ahí nosotros deberemos instalar únicamente lo que necesitemos para llevar a cabo lo que queramos hacer, en este caso, ejecutar los tests sobre el código. De esta forma tenemos un control total de lo que hay instalado y podemos añadir exclusivamente los paquetes que necesitemos, a diferencia de las imágenes oficiales de los lenguajes que instalan un abanico mayor de herramientas normalmente y en consiguiente pesan más.

### Decisión imagen base: Pruebas rendimiento y almacenamiento imágenes base para Ruby
A continuación se va a realizar una comparativa de almacenamiento y velocidad de ejecución de los tests con diversas imágenes base con el objetivo de elegir una para el contenedor que ejecutará los tests, dichas imágenes han sido explicadas en en [siguiente enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/Imagenes_base.md). Índice:
1. [Pruebas](#id1)
   1. [Imágenes base oficiales](#id4)
   2. [Imagen base no oficial del lenguaje, Sistema operativo base (Alpine)](#id5)
2. [Comparación de resultados](#id2)
   1. [Comparación entre imágenes oficiales de Ruby](#id5)
   2. [Comparación mejor imagen base oficial del lenguaje con imagen no oficial (Sistema operativo Alpine como Imagen base)](#id6)
3. [Conclusión y decisión de imagen base](#id3)

<div id='id1' />

## Pruebas

<div id='id4' />

#### Imágenes base oficiales
##### ruby:2.7.2
>Peso:
![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/base/peso.png)

>Tiempo en ejecutar los tests:
![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/base/tiempo1.png)

##### ruby:2.7.2-slim
>Peso:
![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/slim/peso.png)

>Tiempo en ejecutar los tests:
![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/slim/tiempo1.png)

##### ruby:2.7.2-alpine
>Peso:
![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/alpine/peso.png)

>Tiempo en ejecutar los tests:
![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/alpine/tiempo1.png)

<div id='id5' />

#### Imagen base no oficial del lenguaje, Sistema operativo base (Alpine)
##### alpine:3.12.1
>Peso:
![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/alpinepropio/peso.png)

>Tiempo en ejecutar los tests:
![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/alpinepropio/tiempo1.png)


<div id='id2' />

#### Comparación de resultados

<div id='id5' />

##### Comparación entre imágenes oficiales de Ruby
A continuación se recogen los datos de las pruebas anteriores en una tabla:
| Imagen                | Peso   | Tiempo de ejecución tests|
|---                    |---     |---                       |
| **ruby:2.7.2**        | 859MB  | 1,035s                   | 
| **ruby:2.7.2-slim**   | 166MB  | 1,097s                   |  
| **ruby:2.7.2-alpine** | 68MB   | 1,090s                   |

Como podemos ver la imagen que más pesa, con bastante diferencia es la de ruby:2.7.2 y la que menos pesa es la de Ruby Alpine (ruby:2.7.2-alpine) además si nos fijamos en los tiempos de ejecución de tests las diferencias no son muy significativas. Esto se puede deber a lo comentado en la documentación en la que se explican las diferencias entre las imágenes base de Ruby:

- **ruby:2.7.2**  es la más pesada ya que contiene una gran cantidad de paquetes muy comunes para trabajar con Debian.
- **ruby:2.7.2-alpine** es la menos pesada ya que con Alpine obtenemos unas imágenes muy pequeñas y además contiene únicamente los paquetes necesarios para trabajar con Ruby.

<div id='id6' />

##### Comparación mejor imagen base oficial del lenguaje con imagen no oficial (Sistema operativo Alpine como Imagen base)

| Imagen                | Peso   | Tiempo de ejecución tests|
|---                    |---     |---                       |
| **ruby:2.7.2-alpine** | 68MB   | 1,090s                   |
| **alpine:3.12.1**     | 38.7MB | 1,127s                   |

Como podemos ver la imagen oficial del lenguaje basada en Alpine pesa un 43.09% más que si tomamos como base el sistema operativo Alpine y le añadimos nosotros únicamente lo necesario para hacer correr los tests. La diferencia de tiempo a penas es significativa.

<div id='id3' />

##### Conclusión y decisión de imagen base

Teniendo en cuenta todo lo que se ha comentado hasta ahora tanto en este documento principalmente como en [este otro](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/Imagenes_base.md) llego a la siguiente conclusión:

Se va a utilizar como imagen base una no oficial de Ruby, **se utilizará alpine:3.12.1** ya que aún instalando sobre esa imagen todo lo necesario para hacer funcionar los tests pesa un 43.09% menos y presenta un rendimiento muy parecido ya que los tests tardan casi lo mismo en ejecutarse. Además, una de las razones por la que también me he decidido por usar alpine:3.12.1 instalando encima lo necesario para ejecutar los tests es porque únicamente instalo lo que yo necesito y nada más, de tal forma que se exactamente que paquetes hay instalados y puedo tener un mayor control sobre el contenedor de esta forma, además como se ha mencionado, esto hace que pese menos.

### Optimización de la imagen resultante
Como ya se ha comentado en [otros apartados](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/pruebasIm%C3%A1genes.md), para construir el contenedor se ha utilizado como imagen base Alpine. Ésto es así debido a que es una imagen muy ligera. Pero además se ha decidido escoger Alpine en vez de una imagen base oficial del lenguaje, en este caso Ruby, debido a que se instalan en esta imagen base una gran cantidad de paquetes, los cuales actualmente no necesito.

Así al coger como imagen base Alpine únicamente he tenido que instalar lo que he necesitado, como es el caso de ruby, bundler y rake. Debido a ésto no he necesitado borrar paquetes innecesarios que viniesen instalados en la imagen base ya únicamente es Alpine.

Debido a esta decisión el contenedor resultante es muy ligero, mucho más que la imagen base oficial de ruby sobre Alpine que pesa casi el doble que la que he construido yo.

| Imagen                | Peso   | Tiempo de ejecución tests|
|---                    |---     |---                       |
| **ruby:2.7.2-alpine** | 68MB   | 1,090s                   |
| **alpine:3.12.1**     | 38.7MB | 1,127s                   |

Para conseguir esto se ha seguido algún consejo que encontramos en la [siguiente página](https://blog.codacy.com/five-ways-to-slim-your-docker-images/):
- Se ha pensado en las necesidades de la aplicación: Únicamente se han instalado los paquetes estrictamente necesarios para trabajar con ruby y poder ejecutar los tests.
- Se ha elegido una imagen base pequeña: Como imagen base se ha elegido Alpine (no oficial del lenguaje) ya que Alpine nos ayuda a lograr este propósito porque es una imagen muy pequeña y sencilla, mucho más que si hubiésemos cogido Debian por ejemplo pesaría bastante más debido a que vienen con mayor cantidad de paquetes instalados y el propio Debian es más pesado.
- Se ha intentado usar el mínimo número posible de capas: Se han agrupado en lo posible varios comandos en uno solo como por ejemplo cuando se han instalado los paquetes necesarios para trabajar con ruby y ejecutar los tests, se ha hecho únicamente con un comando.
- Se ha instlado únicamente lo necesario: Partiendo de una imagen no oficial del lenguaje, en mi caso Alpine se ha instalado únicamente los paquetes necesarios para poder ejecutar los tests correctamente. Se ha tomado esta decisión para conseguir un menor tamaño y tener mayor control sobre los paquetes que hay instalados en el sistema.

## Integración continua
### Buenas prácticas a seguir con Travis debido al sistema de créditos

Este documento se escribe a partir de haber agotado los créditos de Travis tal y como se puede ver en la siguiente imagen:

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/buenaspracticas/1.png)

Como podemos ver Travis cuenta con un sistema de créditos que se agota en función de lo que se comenta en la siguiente imagen:

![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/buenaspracticas/2.png)

Esto ha ocurrido debido a que se han realizado una serie de acciones que podrían haberse realizado de mejor forma tal y como se van a comentar en los apartados siguientes.

#### Cuando hacer push

Uno de los principales problemas por los que se han agotado los créditos es debido a que se han realizado demasiados push y en consecuencia se ha ejecutado travis muchas veces.

Se puede reducir el número de push realizados con una práctica muy sencilla, agrupar varios commits en un push en vez de hacer para cada commit un push.

#### Versiones a probar

Cuando probamos distintas versiones del lenguaje para ver cuáles soporta nuestra aplicación podríamos probar por ejemplo en el caso de ruby las versiones 2.7.2, 2.7.1, 2.7.0, 2.6.0... Esto es un problema con el sistema de créditos de Travis ya que estará ejecutando durante más tiempo y en consecuencia gastando más créditos.

Para solucionar esto, sería suficiente con probar con las últimas versiones de cada serie, en la serie 2.7 por ejemplo sería suficiente con probar la versión 2.7.2

#### Posibilidad de ejecutar los tests localmente
Otra posibilidad es ejecutar los tests de forma local. Simplemente haremos uso del gestor de tareas y la orden creada para ello `rake test` y así nos ahorraremos tener que usar travis tan continuadamente.

#### Hacer que Travis no se ejecute
Si queremos que Travis no se ejecute, podemos añadir al mensaje del commit `[skip ci]`. Esto es muy útil cuando estamos haciendo documentación y hacemos push y no necesitamos que se ejecute Travis.

### Travis
#### Travis CI para integración continua
Se ha utilizado este sistema con el objetivo de probar a ejecutar los tests haciendo uso de versiones más antiguas del lenguaje.

##### Integración continua funcionando
[En este enlace](https://travis-ci.com/github/antoniocuadros/WhenToClass) se puede consultar la integración continua funcionando.

Se adjunta imagen:

![img6](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/fichero/6.png)

Para ver el proceso de registro en Travis CI y enlace con GitHub se puede consultar el [siguiente enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/register.md).

Podemos ver que cada vez que hacemos un push, se ejecuta Travis CI con el objetivo de ejecutar los tests:

![img7](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/fichero/7.png)


##### ¿Qué es Travis CI?
Travis CI es un sistema de integración continua usado para construir y probar productos software alojados en GitHub.

##### ¿Por qué Travis?
Se está utilizando Travis CI debido a la buena integración que posee con GitHub, ya que nos registramos directamente con GitHub haciendo que la vinculación del repositorio sea muy sencilla así como la configuración de la integración continua. Es muy sencillo activar builds automatizadas con cada cambio que realizamos en GitHub configurando un único fichero `.travis.yml`.

Además encontramos una gran cantidad de documentación oficial y muchísimos usuarios en todo internet que hacen uso de Travis y que contestan las dudas de otros usuarios dejando constancia de dichas soluciones para todas las personas que se encuentren ante el mismo problema. Todo esto, hace que la curva de aprendizaje sea muy pequeña.

##### ¿Que hace nuestro fichero .travis.yml?

Para empezar a trabajar con Travis CI hemos necesitado crear el fichero y añadir ahí la configuración `.travis.yml` se puede consultar [aquí](https://github.com/antoniocuadros/WhenToClass/blob/master/.travis.yml). No obstante se presenta a continuación:

Se han realizado pruebas con las últimas versiones de cada serie y se ha determinado que funciona nuestra aplicación con las versiones desde la 2.3.0 hasta la 2.7 e incluso la que es en este momento la "ruby-head". Se han dejado únicamente las más representativas, es decir, la head, la [última release: 2.7](https://www.ruby-lang.org/en/downloads/releases/), la que se ha venido utilizando con nuestro gestor de versiones rbenv: 2.6 y además la última compatible: 2.3.

```
language: ruby

#Cacheamos las dependencias
cache: bundler

#Probamos con las últimas versiones de cada rama
rvm:
  #última versión de ruby, se llama en ruby "ruby-head"
  - ruby-head
  #Última release
  - 2.7
  #Versión que estaba utilizando en rbenv
  - 2.6
  #Última release que funciona con nuestro proyecto
  - 2.3

  #Las versiones entre la 2.3 y la 2.6 funcionan con nuestro proyecto de forma correcta

#Para poder trabajar con bundler 2.1.4
before_install:
  - gem install bundler

#Se ejecutan los tests
script: rake test
```

(obsérvese que no se prueba con la última versión del lenguaje ya que eso lo probamos con CircleCI dentro del contenedor)

Adicionalmente cuando se posean créditos se realizarán pruebas con **diferentes sistemas operativos** ya que Travis facilita mucho esta tarea simplemente añadiendo lo siguiente a nuestro fichero de configuración por ejemplo:

```
os:
  - linux
  - osx
  - windows
```

Este fichero hace lo siguiente:

**En primer lugar** se define el lenguaje que se va a utilizar, en este caso Ruby:

```
language: ruby
```

**En segundo lugar** cacheamos las dependencias, esto nos ahorrará algo de tiempo a la hora de ejecutarse bundle install ya que nos ahorramos el tiempo de descarga de las dependencias:

```
cache: bundler
```

Tiempo con las dependencias cacheadas (al final de la imagen a la derecha):

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/fichero/1.png)

Tiempo con las dependencias no cacheadas:

![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/fichero/2.png)

Podemos ver que no existe mucha diferencia a la hora de hacer `bundle install`, pero hay diferencia, pasamos de 1,30s (sin cachear) a 0,32s (cacheando dependencias).

Ahora mismo no es una diferencia muy significativa pero cuando el proyecto vaya creciendo y aumenten el número de dependencias podrá suponer una mayor diferencia, debido a esto se ha optado por seguir manteniendo en caché las dependencias.

**En tercer lugar** indicamos todas las versiones de Ruby que funcionan con nuestro proyecto:

(se adjuntan las fotos de las versiones que se probaron antes de agotarse los créditos, en cuanto posea créditos adjuntaré las imágenes de Travis funcionando con las últimas versiones de cada serie y además se ha utilizado la última versión del lenguaje especificada como ruby-head)

```
rvm:
  #última versión de ruby, se llama en ruby "ruby-head"
  - ruby-head
  #Última release
  - 2.7
  #Versión que estaba utilizando en rbenv
  - 2.6
  #Última release que funciona con nuestro proyecto
  - 2.3

  #Las versiones entre la 2.3 y la 2.6 funcionan con nuestro proyecto de forma correcta
```

Se pueden ver todas las versiones de ruby funcionando, de la 2.3 a la head funcionando (en un repositorio que es un clon de este en gitlab ya que no me quedan créditos con esta cuenta) en la siguiente imagen:

![img44](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/versiones_gitlab.png)


En versiones anteriores a la 2.3.0 nuestro proyecto deja de funcionar:

![img4](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/fichero/4.png)

![img5](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/fichero/5.png)

Esto es debido a que nosotros tenemos que utilizar bundler en su versión 2.1.4 y dicha versión no es compatible con versiones anteriores a ruby 2.3.0, para versiones anteriores a ruby 2.3.0 debemos utilizar bundler 1.17.3.

**A continuación** ejecutamos:

```
before_install:
  - gem install bundler
```

Esto nos permite trabajar con bundler 2.1.4.

**En siguiente lugar** ejecutamos los tests:

```
script: rake test
```

Cuando hacemos un push vemos que en Travis CI se ejecutan los tests:

![img8](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/fichero/8.png)


###### Nota
Como se puede observar parece que no estoy instalando las dependencias, pero esto no es así, no hace falta utilizar explicitamente la orden `bundle install` en nuestro fichero `.travis.yml` ya que se ejecuta de forma automática tal y como se indica en la [guía de Travis de como construir un proyecto escrito en Ruby](https://docs.travis-ci.com/user/languages/ruby/#dependency-management).

Vemos en la siguiente imagen como efectivamente, se instalan las dependencias:

![img9](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/fichero/9.png)


Las capturas se han sacado del [siguiente](https://travis-ci.com/github/antoniocuadros/WhenToClass/jobs/427121652) trabajo de Travis.


## Circle CI
### Circle CI para integración continua
Se ha utilizado este sistema con el objetivo de utilizar docker para probar con la última versión del lenguaje la ejecución de los tests.

#### Integración continua funcionando

En la siguiente imagen podemos ver la integración continua funcionando con Circle CI:

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/circleci/1.png)

El proceso de registro en Circle CI es muy similar al proceso de registro en Travis, visitamos su página [web oficial](https://circleci.com/) y desde ahí nos registramos con GitHub y activamos el repositorio que deseemos, en este caso, el repositorio [WhenToClass](https://github.com/antoniocuadros/WhenToClass).

Podemos ver que cada vez que hacemos un push, se ejecuta Circle CI con el objetivo de ejecutar los tests:

![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/circleci/2.png)

#### ¿Qué es Circle CI?
Circle CI es un sistema de integración continua usado para construir y probar productos software alojados en GitHub y Bitbucket.

#### ¿Por qué Circle CI?
Se está utilizando Circle CI debido a que al igual que Travis posee una buena integración con GitHub. Gracias a esta integración con GitHub es muy sencillo registrarnos y activar la integración continua que ofrece este sistema en nuestros repositorios. Además la configuración es muy sencilla haciendo uso del fichero `config.yml` que se encuentra en la carpeta `.circleci` y puede consultarse en el [siguiente enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/.circleci/config.yml)

En un primer momento se empezó a utilizar [Shippable](https://www.shippable.com/) pero debido a una gran cantidad de problemas que tuve utilizándolo, que se pueden observar en la gran cantidad de commits realizados (que van desde [este](https://github.com/antoniocuadros/WhenToClass/commit/6cdafd034e299b6669bcbd9cb63c7fe1803887f0)  a [este otro](https://github.com/antoniocuadros/WhenToClass/commit/d00e223e48c9ff46ce83ac61938cd61c44b01e2c)) intentando solucionar problemas, decidí dejarlo y buscar otro sistema. Una de las principales razones por las que decidí dejar de intentar configurar Shippable fue debido a que mi objetivo era usar Shippable para construir el contenedor y ejecutar los tests en el mismo a diferencia de lo que hacemos en Travis que ejecutamos sin contenedor para probar todas las versiones posibles del lenguaje y para trabajar con Docker no encontré suficiente documentación ni oficial ni por parte de la comunidad y me costaba mucho avanzar. [Aquí](https://app.shippable.com/github/antoniocuadros/WhenToClass/runs/32/1/console) se puede ver una de las pruebas fallando en Shippable para dejar constancia de su uso.

En cambio, Circle CI, nada más introducirnos en su [página web](https://circleci.com/product/#features) asguran un "soporte para Docker de primera clase" y efectivamente, el trabajo con Docker ha sido muy sencillo para poder tanto construir el contenedor como para ejecutar los tests dentro del mismo en gran parte debido a la muy buena documentación que encontramos sobre Docker en su página.

#### ¿Que hace nuestro fichero .circleci/config.yml?

Para empezar a trabajar con Circle CI hemos necesitado crear una primera carpeta oculta llama `.circleci` y en esa carpeta metemos el archivo de configuración llamado `config.yml`. Dicho fichero es lo que se comenta a continuación y puede ser consultado [aquí](https://github.com/antoniocuadros/WhenToClass/blob/master/.circleci/config.yml). No obstante se presenta a continuación:

```
#vesión de circle ci
version: 2.1

#trabajo que buildea una imagen y ejecuta los tests en el contenedor
jobs:
  build:
    docker:
      - image: antoniocuadros/whentoclass
    steps:
      - checkout
      - run: rake test
```

Como podemos ver, es un fichero muy sencillo y hace lo siguiente:

**En primer lugar** se define la [versión](https://circleci.com/docs/reference-2-1/#version) de Circle CI que se está utilizando:

```
version: 2.1
```


**En segundo lugar** se define un [trabajo](https://circleci.com/docs/2.0/concepts/#jobs), un trabajo no es más que un componente básico de configuración y están formado por un conjunto de pasos que ejecutan tanto comando como scripts, en nuestro caso concreto, ejecutamos comandos.

Cada trabajo debe declarar un "ejecutor" que puede ser docker, machine, windows o macos.

Un [ejecutor](https://circleci.com/docs/2.0/concepts/#executors-and-images) define una tecnología/entorno subyacente en el que se va a ejecutar un trabajo. En mi caso se ha elegido hacer las pruebas haciendo uso de docker ya que vamos a reutilizar el contenedor creado de Docker Hub, además le indicamos nuestra imagen de para que la traiga (haga pull).

Todo lo comentado hace referencia al siguiente fragmento de código:

```
jobs:
  build:
    docker:
      - image: antoniocuadros/whentoclass
```

**Por último** como hemos dicho un trabajo se compone de pasos, estos pasos en nuestro caso será hacer checkout y ejecutar los tests desde dentro del contenedor con la orden `rake test`, al haber dicho que usamos como ejecutor docker y nuestra propia imagen de Docker Hub ya estamos trabajando dentro del contenedor, debido a esto ejecutamos directamente esa orden y no nos hace falta indicar volúmenes, todo lo hacemos dentro del contenedor ya. Lo mencionado hace referencia a:

```
steps:
  - checkout
  - run: rake test
```

### Aprovechamiento del contenedor en sistemas de Integración Continua
Como ya hemos visto anteriormente se ha hecho uso de tres sistemas de integración continua como es Travis CI, Circle CI y GitHub Actions.


No en todos se ha hecho uso del contenedor, aunque fácilmente se habría podido usar el contenedor en el sistema que no se ha hecho uso pero se ha hecho así por un motivo. Se detalla esto a continuación.


De los tres sistemas, se ha hecho uso del contenedor para ejecutar los tests tanto en Circle CI como en la action de GitHub.

#### Circle CI
En este sistema de integración continua como ya se ha comentado se ha hecho uso del contenedor para ejecutar los tests y así nos evitamos tener que configurar de nuevo la instalación y gestión de dependencias de acuerdo a la sintaxis del fichero de configuración del sistema de integración continua ya que todo está configurado en el contenedor. 


El uso del contenedor en este sistema de integración continua ha sido muy sencillo de incorporar y **no ha sido necesario ninguna adaptación del contenedor** ya que todo ha funcionado correctamente y de acuerdo a lo especificado en el Dockerfile.


Se ha hecho uso del contenedor de la siguiente forma:

```
  build:
    docker:
      - image: antoniocuadros/whentoclass
    steps:
      - checkout
      - run: rake test
```

#### Travis CI
En Travis CI no se ha hecho uso del contenedor. Esto es debido a que se ha querido probar con distintas versiones de Ruby para saber en qué versiones funciona nuestra aplicación. 


De esta forma se ha configurado Travis para que se haga todo de forma análoga a lo que hace el contenedor (instalar dependencias, ejecutar los tests) pero probando con varias versiones del lenguaje, hasta que hemos encontrado las versiones en las que funciona correctamente nuestra aplicación.

### Uso del gestor de tareas en Integración Continua
Nosotros hemos utilizado como sistemas de integración continua principalmente Travis CI y Circle CI aunque como ya se ha comentado, también se ha escrito una GitHub action que hace pasar los tests y hace push a GitHub Container Registry.

En todos estos sistemas, en algún punto será necesario ejecutar la orden correspondiente del gestor de tareas que ejecutará los tests. En nuestro caso, se ha utilizado como gestor de tareas rake tal y como se ha comentado en documentos como [este](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Herramientas/rake.md). En concreto en algún punto deberemos ejecutar la orden `rake test` para poder ejecutar los tests.

Recordamos que esta tarea del gestor de tareas, ejecutará los tests sobre los métodos de las clases Asignatura y GestorAsignaturas.

#### Travis CI
En el caso de travis podemos ver que se hace uso del gestor de tareas en el apartado **script** de la siguiente forma:

```
script: rake test
```

Como podemos ver se está haciendo uso del gestor de tareas rake y además se ejecuta la orden que hace correr los tests.

#### Circle CI
En el caso de Circle CI, hacemos uso del contenedor creado para ejecutar los tests. En este caso, una vez dentro del contenedor, ejecutamos, `rake test`:

```
    steps:
      - checkout
      - run: rake test
```