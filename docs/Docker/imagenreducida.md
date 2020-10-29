# Optimización de la imagen resultante
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
