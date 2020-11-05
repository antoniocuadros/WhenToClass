# WhenToClass :books:

![logo](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/logo.jpg)


## :notebook: ¿Qué problema se pretende resolver?
Con este proyecto se pretende dar solución a un problema al que nos enfrentamos en la actualidad los estudiantes de Ingeniería Informática, este problema consiste en saber qué días debemos ir a clases y a qué horas a cada una de las asignaturas debido a la semipresencialidad con la que nos encontramos debido a la situación actual.
Así se pretende crear un microservicio REST que permita responder a las siguientes preguntas muy frecuentes entre los estudiantes hoy en día sobre cada asignatura:
- ¿Qué horario tiene la asignatura "X"?
- ¿Qué días tengo que ir si soy del turno de presencialidad "Y" de la asignatura "X"?

### Motivación
Como ya se ha comentado anteriormente, en la actualidad los estudiantes de Informática nos encontramos con constantes dudas relacionadas con qué días debemos acudir a una determinada asignatura debido a la semipresencialidad que nos encontramos debido a la situación presente. Debido a esto se pretende elaborar un microservicio REST que permita a los usuarios consultar el horario de ciertas asignaturas tanto de teoría como de prácticas, así como saber que días les corresponde ir pudiendo consultar la lista de días asignados en función del turno de presencialidad al que pertenecen.


## :hammer: Documentación
### Integración Continua
- [En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/ficherotravis.md) se puede ver la integración continua con Travis CI funcionando y la justificación de la misma.

- [En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/ficherocicleci.md) se puede ver la integración continua con Circle CI funcionando y la justificación de la misma.

- Se ha creado una github action, [se puede consultar aquí](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/githubaction.md) la documentación, con el objetivo de mantener actualizado el contenedor de Docker Container Registry.

- [En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/usogestordetareas.md) se puede consultar el uso del gestor de tareas en los distintos sistemas de integración continua utilizados.

- [En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/contenedor.md) se puede consultar el uso del contenedor en los distintos sistemas de integración continua.

- [En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/buenaspracticas.md) se puede consultar una pequeña documentación de buenas prácticas que se pueden seguir desde mi experiencia usando Travis en relación al sistema de créditos.
  
#### Pasos previos
- [En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/register.md) se puede consultar el proceso de registro en Travis y la vinculación con GitHub.

- [En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/investigacionPrevia.md) se puede consultar una documentación sobre una investigación previa sobre como trabajar con Travis y ruby y con contenedores.

### Docker: Entorno de prueba para los tests
- [En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/Imagenes_base.md) se puede consultar documentación acerca de las distintas imágenes base (de forma general) que encontramos para Ruby.

- [En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/pruebasIm%C3%A1genes.md) se puede consultar el proceso de decisión de la imagen base incluyendo pruebas entre distintas imágenes y la justificación de la [elección final](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/pruebasIm%C3%A1genes.md#id3).
  
- [En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/Dockerfile) se puede consultar el Dockerfile.
  
- [En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/buenas_practicas.md) se pueden consultar las buenas prácticas seguidas para la realización de mi Dockerfile y como se han aplicado a la hora de escribirlo.

- [En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/dockerhub.md) se puede consultar una pequeña documentación sobre Docker Hub y como se ha configurado para hacer build de forma automática, además podemos ir directamente al [repositorio creado en Docker Hub](https://hub.docker.com/r/antoniocuadros/whentoclass).

- [En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/githubpackageregistry.md) se puede consultar documentación acerca de la subida del contenedor a Github Container Registry y además podemos ir directamente al [contenedor subido](https://github.com/users/antoniocuadros/packages/container/package/whentoclasstests).
  
- [En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/exectestsdocker.md) se puede consultar como descargar las imágenes desde Docker Hub o GitHub Container Registry y ejecutar los tests en el contenedor.

- [En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/imagenreducida.md) se puede consultar información de cómo se ha obtenido una imagen de poco tamaño.
  
### Herramientas
[En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Herramientas/herramientas.md) se pueden consultar todas las herramientas utilizadas tanto generales como específicas de Ruby.

### Ficheros relevantes
- [Clase Asignatura](https://github.com/antoniocuadros/WhenToClass/blob/master/lib/asignatura.rb).
- [Clase GestorAsignaturas](https://github.com/antoniocuadros/WhenToClass/blob/master/lib/gestorasignaturas.rb).
- [Struct horarioAsignatura](https://github.com/antoniocuadros/WhenToClass/blob/master/lib/horarioasignatura.rb).
- [Tests de clase Asignaturas](https://github.com/antoniocuadros/WhenToClass/blob/master/t/TestAsignaturas.rb).
- [Tests de la clase GestorAsignaturas](https://github.com/antoniocuadros/WhenToClass/blob/master/t/TestGestorAsignaturas.rb).
- [Clase propia para excepciones](https://github.com/antoniocuadros/WhenToClass/blob/master/lib/asignaturaerror.rb)

### Test de las clases e instalar dependencias
[En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Clases/test.md) se puede consultar información sobre cómo testear e instalar dependencias.
### Historias de Usuario
[En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/HistoriasUsuario/HistoriasUsuario.md) puede consultarse las diversas historias de usuarios que hay activas en cada momento.

### Pasos en la realización del proyecto
[En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/PasosProyecto/Pasos.md) puede consultarse documentación adicional acerca de los pasos que se llevarán acabo para completar el proyecto.

### Ejecución de los tests
[En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/tests/tests.md) se puede consultar documentación acerca de los tests.

### Fichero iv.yaml
[En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/iv.yaml) se puede consultar el fichero iv.yaml.

### Configuración Inicial
[En este enlace](https://github.com/antoniocuadros/ejercicios-apuntes-IV/blob/master/Configuraci%C3%B3n%20gitHub/ConfiguracionGit.md) se puede comprobar la configuración de GitHub.

### Autor
[Antonio Cuadros Lapresta](https://github.com/antoniocuadros)
