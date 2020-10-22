# Posibilidades de elección como imagen base
Cuando tenemos que elegir una imagen base para nuestro contenedor encontramos varias posibilidades, elegir una imagen base oficial de un determinado lenguaje, o partir de un sistema operativo base.
## Imágenes base oficiales Ruby
En Ruby principalmente podemos encontrar tres tipos de imágenes base:
### ruby:\<version\>
>Esta imagen es la por defecto de Ruby y se recomienda su uso cuando las necesidades de un proyecto no están claras en un principio. Podemos encontrar etiquetas como buster o stretch que indican la versión de Debian en la que se basa la imagen. Esta imagen cuenta con una gran cantidad de paquetes muy comunes en Debian.

### ruby:\<version\>-slim
>Esta imagen no contiene los paquetes más comunes de la etiqueta por defecto comentada anteriormente. Únicamente contiene los paquetes mínimos para ejecutar Ruby.

### ruby:\<version\>-alpine
>Esta imagen está basada en Alpine Linux, y es muy popular en la actualidad debido a que genera imágenes de muy pequeño tamaño. De esta forma esta imagen es la deseada cuando el objetivo principal es que la imagen sea lo más pequeña posible. Como principal advertencia, esta imagen hace uso de musl libc en vez de glibc. Como es una imagen muy pequeña únicamente se incluyen las herramientas básicas para trabajar con Ruby.

## Usando un sistema operativo como imagen base
### alpine:\<version\>
>Esta opción nos permite crear el contenedor totalmente a nuestra medida ya que partimos de un sistema operativo base como en este caso es Alpine y a partir de ahí nosotros deberemos instalar únicamente lo que necesitemos para llevar a cabo lo que queramos hacer, en este caso, ejecutar los tests sobre el código. De esta forma tenemos un control total de lo que hay instalado y podemos añadir exclusivamente los paquetes que necesitemos, a diferencia de las imágenes oficiales de los lenguajes que instalan un abanico mayor de herramientas normalmente y en consiguiente pesan más.