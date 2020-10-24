# Pasos a llevar a cabo para completar el proyecto :walking:
> Con cada hito se irá completando en este documento hasta llegar al último hito.

Para completar este proyecto se utilizan como guía los distintos Hitos que se nos proponen en la asignatura que van desde una descripción muy general del proyecto hasta la creación de una infraestructura virtual, uso de herramientas de configuración, pruebas, despliegue... conforme avancen los hitos.

De esta forma este documento sirve para de un vistazo rápido poder visualizar el camino de trabajo que seguiremos para poder alcanzar los objetivos a realizar hito a hito (desde el hito 1 se referencia cada hito con su correspondiente milestone).

## Hito 0: Descripción general del proyecto.
- Creación del repositorio
    - README
    - Licencia
    - .gitignore
- Descripción general del proyecto especificada en el readme.
- Elección del lenguaje de programación.
- Configuración correcta de git.

## [Hito 1](https://github.com/antoniocuadros/WhenToClass/milestone/1): Esctructura general del proyecto
- Creación de una primera [clase sin implementar](https://github.com/antoniocuadros/WhenToClass/issues/6).
- [Crear el subdirectorio docs](https://github.com/antoniocuadros/WhenToClass/issues/2) para contener documentación adicional.
- Añadir una [descripción general de las herramientas](https://github.com/antoniocuadros/WhenToClass/issues/1) que se pretenden utilizar en un proyecto de este tipo.
- [Mejorar la descripción inicial](https://github.com/antoniocuadros/WhenToClass/issues/4) de la aplicación
- [Mejoras al README añadiendo motivación](https://github.com/antoniocuadros/WhenToClass/issues/7).
- Creación del [archivo iv.yaml](https://github.com/antoniocuadros/WhenToClass/issues/3)
- Creación de [historias de usuario](https://github.com/antoniocuadros/WhenToClass/issues/11) como issues y además incluidas como documentación.
    - Documentación adicional como este documento.

## [Hito 2](https://github.com/antoniocuadros/WhenToClass/milestone/2): Tests
La realización de este hito consiste en entender la necesidad de los tests unitarios como herramienta fundamental en el desarrollo software. Además se deben realizar los tests para cada una de las funciones e implementarlas.
- Implementar tests para cada una de las funciones del código:
    - [Método obtenerHorario](https://github.com/antoniocuadros/WhenToClass/issues/14)
    - [Método obtenerDiasPresenciales](https://github.com/antoniocuadros/WhenToClass/issues/15)
    - [Método tengoQueIrEstaSemana](https://github.com/antoniocuadros/WhenToClass/issues/24)
- Implementar los métodos que testearan los tests unitarios
    - [Método obtenerHorario](https://github.com/antoniocuadros/WhenToClass/issues/17)
    - [Método obtenerDiasPresenciales](https://github.com/antoniocuadros/WhenToClass/issues/18)
    - [Método tengoQueIrEstaSemana](https://github.com/antoniocuadros/WhenToClass/issues/23)
- [Mejora de la documentación y el README](https://github.com/antoniocuadros/WhenToClass/issues/20)
    - Explicación de cada herramienta a utilizar
    - Explicación de como instalar la clase
    - Explicación de como testear la clase
- [Creación y uso de un Rakefile](https://github.com/antoniocuadros/WhenToClass/issues/19)
- [Creación de la clase GestorAsignaturas](https://github.com/antoniocuadros/WhenToClass/issues/26)
- [Tests métodos clase GestorAsignaturas](https://github.com/antoniocuadros/WhenToClass/issues/27)

De esta forma han avanzado las historias de usuario [HU1](https://github.com/antoniocuadros/WhenToClass/issues/8), [HU2](https://github.com/antoniocuadros/WhenToClass/issues/9), [HU3](https://github.com/antoniocuadros/WhenToClass/issues/10) y [HU4](https://github.com/antoniocuadros/WhenToClass/issues/28).
## [Hito 3](https://github.com/antoniocuadros/WhenToClass/milestone/3): Creación de un contenedor para pruebas
En esta entrega se busca configurar y documentar un contenedor para ejecutar tests así como probar a subirlos a distintos registros de contenedores.
- [Se ha añadido toda la documentación necesaria](https://github.com/antoniocuadros/WhenToClass/issues/33).
- [Se ha añadido un Dockerfile para crear un contenedor para ejecutar los tests](https://github.com/antoniocuadros/WhenToClass/issues/36).
- Se ha subido el contenedor a Docker Hub.
- Se ha subido el contenedor a Github Container Registry.
- Se han documentado las pruebas realizadas para la elección del contenedor y la decisión final
- Se han documentado las buenas prácticas a la hora de escribir un Dockerfile.

## Hito 4: Despliegue de una aplicación en un PaaS
Se pretende hacer un despliegue en la nube uasndo una plataforma como servicio. Para esto será necesario realizar un script de configuración del PaaS, documentar como hacer el despliegue y agregar diversos ficheros de definición y lanzamiento de los servicios en el PaaS.

## Hito 5: Contenedores para un microservicio
En esta entrega se pretende desplegar un contenedor si es posible en más de una plataforma, descripción de los pasos para realizar dicho desplegue y automatizarlo. Documentación de los Dockerfiles.

## Hito 6: Provisionamiento de máquinas virtuales
Creación de un fichero de provisionamiento y buena documentación del mismo. Elegir un sistema operativo base justificando dicha elección. Publicación de la imagen del SO en algún repositorio de imágenes público. Configuración de un gestor de tareas.


