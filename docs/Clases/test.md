### Testear la clase asignatura
Como ya se ha mencionado anteriormente, se ha utilizado rake para automatizar este tipo de tareas, por ello, para testear la clase asignatura tendremos que hacer:

`rake test`

Para poder ejecutar ésto es necesario tener instalado rake (`gem install rake`).

Con esto se ejecutan tanto los tests para la clase Asignatura como para la clase GestorAsignaturas.

Se pueden ver [aquí](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/tests/tests.md) la ejecución de los tests junto a una pequeña explicación.

### Instalar las dependencias
Para poder instalar las dependencias será necesario ejecutar:

`rake install`

Es necesario instalar bundler para ejecutar esta tarea (`gem install bundler`).

Se puede ver una imagen [aquí](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/rakeinstall/install.png) de una ejecución de `rake install` en mi equipo.

Se instalarán las dependencias de nuestro proyecto, dichas dependencias se encuentran especificadas en el [Gemfile](https://github.com/antoniocuadros/WhenToClass/blob/master/Gemfile) y [Gemfile.lock](https://github.com/antoniocuadros/WhenToClass/blob/master/Gemfile.lock). 
- **Gemfile:** es un fichero donde especificamos que gemas queremos usar. 
- **Gemfile.lock:** es un fichero donde Bundler graba las versiones exactas que tenemos instaladas de nuestras gemas y que será utilizado cuando se haga bundle install en la tarea rake test para instalar las dependencias junto al fichero Gemfile para saber de donde obtener las gemas. El proceso es el siguiente: al hacer bundle install (lo que hace nuestra tarea `rake install`) bundler mira primero en el gemfile.lock para saber las versiones exactas de nuestras gemas, luego mira en el gemfile para generar una lista de gemas válidas y las instala o actualiza según el caso.