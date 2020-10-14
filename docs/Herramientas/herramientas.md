## :wrench: Herramientas
- **Lenguaje de programación:** Se utilizará Ruby como lenguaje de programación debido a que lo he usado en otras asignaturas, me parece muy útil y me gustaría seguir profundizando en él.
- **Base de datos:** La aplicación deberá obtener la información solicitada por los usuario de una determinada base de datos que puede ser tanto local (haciendo uso de ficheros JSON) como remota haciendo uso de bases de datos relacionales o no relacionales como MongoDB en este último caso.
- **Sistema de logs:** Tal y como se menciona [aquí](https://jj.github.io/curso-tdd/temas/servicios.html) el sistema de logs es uno de los servicios más importantes ya que nos permite registrar los eventos que ocurren para posteriormente analizarlos en busca de problemas tanto del servicio en sí como de prestaciones y otros muchos más aspectos.

### Herramientas específicas de ruby
#### Gestor de versiones
##### rbenv
Para la realización de este proyecto se está utilizando el gestor de versiones RBENV, podemos consultar la página oficial de este manejador de versiones en este [enlace](https://github.com/rbenv/rbenv) que nos lleva a su repositorio oficial apoyado por la comunidad.
RBENV nos permite implementar cada proyecto con nuestro entorno totalmente autónomo pudiendo elegir una versión específica de Ruby y las gemas necesarias para ejecutar nuestra aplicación, a diferencia de rvm, rbenv es bastante más ligero y aborda una mayor cantidad de versiones de este lenguaje así como permite cambiar la configuración global de Ruby por cada usuario.

###### ¿Por qué rbenv?
Se ha elegido como gestor de versiones rbenv ya que aporta una gran flexibilidad, mayor incluso que rvm manejando las distintas versiones del lenguaje Ruby y además de una forma más sencilla a como se hace con rvm. Por otra parte presenta una serie de ventajas (frente a rvm) como:
- No necesita cargarse en la shell.
- No existe un fichero de configuración ya que lo único que nos interesa es con qué versión de Ruby queremos trabajar, haciendo su uso mucho más sencillo.
- Mucho más ligero.
- Simplicidad y facilidad de uso.

Se descartó el uso de RVM por las ventajas comentadas de rbenv, podemos consultar información de RVM  [aquí](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Herramientas/rvm.md).
#### Herramienta de pruebas
##### minitest
Para la realización de este proyecto se utiliza como herramienta para realizar las pruebas del código la herramienta minitest. Esta herramienta es la evolución de unit/test que incluye más funcionalidades como por ejemplo Mocks. Es una herramienta escrita en Ruby para probar código escrito en este mismo lenguaje. Permite realizar lo que se conoce como pruebas unitarias, es decir, probar clases y métodos al igual que RSPEC. Además minitest continúa evolucionando gracias a los aportes de la comunidad y el trabajo de cientos de colaboradores. Se puede consultar el repositorio oficial [aquí](https://github.com/seattlerb/minitest).
###### ¿Por qué minitest?
Se ha elegido debido a que es una herramienta muy sencilla con una sintaxis también muy sencilla ya que todo se escribe como si fuese una clase de Ruby con sus métodos, donde cada método es un test. En cuanto a la documentación a diferencia de RSPEC, he sido capaz de encontrar una mayor cantidad de [documentación](http://docs.seattlerb.org/minitest/Minitest/Assertions.html) y la curva de aprendizaje ha sido mucho menor al tener una sintaxis muy intuitiva y limpia ya que es simplemente Ruby. Además no genera ficheros a diferencia de RSPEC que genera una carpeta y además un fichero dentro de esa carpeta con código que cuesta encontrar para lo que sirve en la documentación oficial, minitest no nos genera en nuestro directorio ningún fichero, sólo debemos empezar a escribir tests.
Además, minitest es mucho más rápido ejecutando tests e incluye el uso de fixtures sin tener que instalar nada más.

Se descartó el uso de RSpec por las ventajas comentadas anteriormente, no obstante, podemos consultar información del mismo [aquí](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Herramientas/rspec.md)
#### Herramienta de gestión de dependencias
##### Bundler
Para la realización de este proyecto se está utilizando como herramienta de gestión de dependencias (en el caso de Ruby son conocidas como gemas) Bundler. Es una herramienta que permite realizar un seguimiento de las gemas así como su instalación. Es un proyecto apoyado por la comunidad que realiza aportaciones a su [repositorio oficial](https://github.com/rubygems/rubygems/tree/master/bundler) de forma constante para mejorarlo de forma continuada. Dada una lista de gemas, Bundler puede tanto descargarlas como instalarlas así como otras gemas necesarias para las gemas que se han indicado. Además proporciona facilidades para actualizar las gemas instaladas y registra las versiones que se encuentran instaladas.
###### ¿Por qué Bundler?
Se ha elegido Bundler debido a que es una herramienta muy extendida en lo que a desarrollo en Ruby se refiere debido a su sencillez de utilización e instalación así como debido a la gran cantidad de documentación existente sobre Bundler y todas las ventajas mencionadas en el apartado anterior, ya que aporta una gran flexibilidad gracias a todas las opciones comentadas.
#### Framework para aplicaciones web
Se utilizará debido a la baja complejidad del proyecto un framework sencillo, como por ejemplo es el caso de [Sinatra](http://sinatrarb.com/) que se describe así mismo como "Sinatra is a DSL for quickly creating web applications in Ruby with minimal effort" y además posee una gran cantidad de documentación tanto [oficial](http://sinatrarb.com/documentation.html) como por parte de la comunidad.

