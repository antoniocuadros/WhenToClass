# WhenToClass :books:
![CircleCI](https://img.shields.io/circleci/build/github/antoniocuadros/WhenToClass?label=Build%20CircleCI) ![Travis (.com)](https://img.shields.io/travis/com/antoniocuadros/WhenToClass?label=Build%20Travis) ![GitHub](https://img.shields.io/github/license/antoniocuadros/WhenToClass) ![GitHub issues](https://img.shields.io/github/issues/antoniocuadros/WhenToClass)

![logo](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/logo.jpg)


## :notebook: ¿Qué problema se pretende resolver?
Con este proyecto se pretende dar solución a un problema al que nos enfrentamos en la actualidad los estudiantes de Ingeniería Informática, este problema consiste en saber qué días debemos ir a clases y a qué horas a cada una de las asignaturas debido a la semipresencialidad con la que nos encontramos debido a la situación actual.
Así se pretende crear un microservicio REST que permita responder a las siguientes preguntas muy frecuentes entre los estudiantes hoy en día sobre cada asignatura:
- ¿Qué horario tiene la asignatura "X"?
- ¿Qué días tengo que ir si soy del turno de presencialidad "Y" de la asignatura "X"?

### Motivación
Como ya se ha comentado anteriormente, en la actualidad los estudiantes de Informática nos encontramos con constantes dudas relacionadas con qué días debemos acudir a una determinada asignatura debido a la semipresencialidad que nos encontramos debido a la situación presente. Debido a esto se pretende elaborar un microservicio REST que permita a los usuarios consultar el horario de ciertas asignaturas tanto de teoría como de prácticas, así como saber que días les corresponde ir pudiendo consultar la lista de días asignados en función del turno de presencialidad al que pertenecen.


## :hammer: Documentación
### Microservicios
- Documentación sobre justificación técnica del framework elegido y como se utiliza dicho framework con un ejemplo inicial, se puede encontrar en el [siguiente enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/microservicios/rub1.md).
- Documentación sobre diseño en general del API, las rutas (o tareas), tipos devueltos por las peticiones y estados devueltos por las mismas, demostración funcionamiento, explicación diseño por capas y HUs que han intervenido se puede encontrar en el [siguiente enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/microservicios/rub2.md).
- Documentación sobre uso de buenas prácticas: configuración distribuida, logs, uso de middleware y gestión de errores se puede encontrar en el [siguiente enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/microservicios/rub3.md).
- Documentación sobre tests de integración de acuerdo con las historias de usuario se puede encontrar en el [siguiente enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/microservicios/rub4.md).

#### Se han creado estos nuevos ficheros
- [app.rb](https://github.com/antoniocuadros/WhenToClass/blob/master/lib/app.rb): Microservicio.
- [middleware.rb](https://github.com/antoniocuadros/WhenToClass/blob/master/lib/middleware.rb): Middleware que se encarga de los logs.
- [TestApi.rb ](https://github.com/antoniocuadros/WhenToClass/blob/master/t/TestApi.rb): Tests del microservicio.
- [Dator.rb ](https://github.com/antoniocuadros/WhenToClass/blob/master/lib/Dator.rb): Clase "abstracta" Dator.
- [TestDator.rb](https://github.com/antoniocuadros/WhenToClass/blob/master/t/TestDator.rb): Tests de la clase Dator.
- [parse.rb](https://github.com/antoniocuadros/WhenToClass/blob/master/lib/parse.rb): clase Parse.
- [TestParse.rb](https://github.com/antoniocuadros/WhenToClass/blob/master/t/TestParse.rb): Tests de la clase Parse.

Se ha refactorizado la clase GestorGrados:
- [gestorgrados.rb ](https://github.com/antoniocuadros/WhenToClass/blob/master/lib/gestorgrados.rb)
- [TestGestorGrados.rb](https://github.com/antoniocuadros/WhenToClass/blob/master/t/TestGestorGrados.rb)

### Documentación anterior
Toda la documentación del proyecto se encuentra recogida en el [siguiente enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/documentacion.md)

### Fichero iv.yaml
[En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/iv.yaml) se puede consultar el fichero iv.yaml.

### Autor
[Antonio Cuadros Lapresta](https://github.com/antoniocuadros)