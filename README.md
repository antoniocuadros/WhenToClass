# WhenToClass :books:

![logo](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/logo.jpg)


## :notebook: ¿Qué problema se pretende resolver?
Con este proyecto se pretende dar solución a un problema al que nos enfrentamos en la actualidad los estudiantes de Ingeniería Informática, este problema consiste en saber qué días debemos ir a clases y a qué horas a cada una de las asignaturas debido a la semipresencialidad con la que nos encontramos debido a la situación actual.
Así se pretende crear un microservicio REST que permita responder a las siguientes preguntas muy frecuentes entre los estudiantes hoy en día sobre cada asignatura:
- ¿Qué horario tiene la asignatura "X"?
- ¿Qué días tengo que ir si soy del turno de presencialidad "Y" de la asignatura "X"?

### Motivación
Como ya se ha comentado anteriormente, en la actualidad los estudiantes de Informática nos encontramos con constantes dudas relacionadas con qué días debemos acudir a una determinada asignatura debido a la semipresencialidad que nos encontramos debido a la situación presente. Debido a esto se pretende elaborar un microservicio REST que permita a los usuarios consultar el horario de ciertas asignaturas tanto de teoría como de prácticas, así como saber que días les corresponde ir pudiendo consultar la lista de días asignados en función del turno de presencialidad al que pertenecen.

## :wrench: Herramientas
- **Lenguaje de programación:** Se utilizará Ruby como lenguaje de programación debido a que lo he usado en otras asignaturas, me parece muy útil y me gustaría seguir profundizando en él.
- **Framework para aplicaciones web:** Se utilizará debido a la baja complejidad del proyecto un framework sencillo, como por ejemplo es el caso de [Sinatra](http://sinatrarb.com/) que se describe así mismo como "Sinatra is a DSL for quickly creating web applications in Ruby with minimal effort" y además posee una gran cantidad de documentación tanto [oficial](http://sinatrarb.com/documentation.html) como por parte de la comunidad.
- **Base de datos:** La aplicación deberá obtener la información solicitada por los usuario de una determinada base de datos que puede ser tanto local (haciendo uso de ficheros JSON) como remota haciendo uso de bases de datos relacionales o no relacionales como MongoDB en este último caso.
- **Sistema de logs:** Tal y como se menciona [aquí](https://jj.github.io/curso-tdd/temas/servicios.html) el sistema de logs es uno de los servicios más importantes ya que nos permite registrar los eventos que ocurren para posteriormente analizarlos en busca de problemas tanto del servicio en sí como de prestaciones y otros muchos más aspectos.

## :hammer: Documentación
### Configuración Inicial

[En este enlace](https://github.com/antoniocuadros/ejercicios-apuntes-IV/blob/master/Configuraci%C3%B3n%20gitHub/ConfiguracionGit.md) se puede comprobar la configuración de GitHub.

### Historias de Usuario
[En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/HistoriasUsuario/HistoriasUsuario.md) puede consultarse las diversas historias de usuarios que hay activas en cada momento.

### Pasos en la realización del proyecto
[En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/PasosProyecto/Pasos.md) puede consultarse documentación adicional acerca de los pasos que se llevarán acabo para completar el proyecto.

### Fichero clase
[En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/lib/asignatura.rb) se puede consultar la clase actual, en este momento los métodos no están implementados, se pretende dar una visión general de lo que se quiere lograr con la misma.

### Autor
[Antonio Cuadros Lapresta](https://github.com/antoniocuadros)
