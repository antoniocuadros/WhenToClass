# Optimización de la imagen resultante
Como ya se ha comentado en [otros apartados](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/pruebasIm%C3%A1genes.md), para construir el contenedor se ha utilizado como imagen base Alpine. Ésto es así debido a que es una imagen muy ligera. Pero además se ha decidido escoger Alpine en vez de una imagen base oficial del lenguaje, en este caso Ruby, debido a que se instalan en esta imagen base una gran cantidad de paquetes, los cuales actualmente no necesito.

Así al coger como imagen base Alpine únicamente he tenido que instalar lo que he necesitado, como es el caso de ruby, bundler y rake. Debido a ésto no he necesitado borrar paquetes innecesarios que viniesen instalados en la imagen base ya únicamente es Alpine.

Debido a esta decisión el contenedor resultante es muy ligero, mucho más que la imagen base oficial de ruby sobre Alpine que pesa casi el doble que la que he construido yo.

| Imagen                | Peso   | Tiempo de ejecución tests|
|---                    |---     |---                       |
| **ruby:2.7.2-alpine** | 68MB   | 1,090s                   |
| **alpine:3.12.1**     | 38.7MB | 1,127s                   |
