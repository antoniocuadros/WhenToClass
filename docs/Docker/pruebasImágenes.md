# Decisión imagen base: Pruebas rendimiento y almacenamiento imágenes base para Ruby
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

### Imágenes base oficiales
#### ruby:2.7.2
>Peso:
![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/base/peso.png)

>Tiempo en ejecutar los tests:
![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/base/tiempo1.png)

#### ruby:2.7.2-slim
>Peso:
![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/slim/peso.png)

>Tiempo en ejecutar los tests:
![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/slim/tiempo1.png)

#### ruby:2.7.2-alpine
>Peso:
![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/alpine/peso.png)

>Tiempo en ejecutar los tests:
![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/alpine/tiempo1.png)

<div id='id5' />

### Imagen base no oficial del lenguaje, Sistema operativo base (Alpine)
#### alpine:3.12.1
>Peso:
![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/alpinepropio/peso.png)

>Tiempo en ejecutar los tests:
![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/alpinepropio/tiempo1.png)


<div id='id2' />

## Comparación de resultados

<div id='id5' />

### Comparación entre imágenes oficiales de Ruby
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

### Comparación mejor imagen base oficial del lenguaje con imagen no oficial (Sistema operativo Alpine como Imagen base)

| Imagen                | Peso   | Tiempo de ejecución tests|
|---                    |---     |---                       |
| **ruby:2.7.2-alpine** | 68MB   | 1,090s                   |
| **alpine:3.12.1**     | 38.7MB | 1,127s                   |

Como podemos ver la imagen oficial del lenguaje basada en Alpine pesa un 43.09% más que si tomamos como base el sistema operativo Alpine y le añadimos nosotros únicamente lo necesario para hacer correr los tests. La diferencia de tiempo a penas es significativa.

<div id='id3' />

## Conclusión y decisión de imagen base

Teniendo en cuenta todo lo que se ha comentado hasta ahora tanto en este documento principalmente como en [este otro](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/Imagenes_base.md) llego a la siguiente conclusión:

Se va a utilizar como imagen base una no oficial de Ruby, **se utilizará alpine:3.12.1** ya que aún instalando sobre esa imagen todo lo necesario para hacer funcionar los tests pesa un 43.09% menos y presenta un rendimiento muy parecido ya que los tests tardan casi lo mismo en ejecutarse. Además, una de las razones por la que también me he decidido por usar alpine:3.12.1 instalando encima lo necesario para ejecutar los tests es porque únicamente instalo lo que yo necesito y nada más, de tal forma que se exactamente que paquetes hay instalados y puedo tener un mayor control sobre el contenedor de esta forma, además como se ha mencionado, esto hace que pese menos.