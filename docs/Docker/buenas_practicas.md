# Buenas prácticas llevadas a cabo para escribir el Dockerfile para ejecución de tests en Ruby
En esta sección se va a analizar el [Dockerfile](https://github.com/antoniocuadros/WhenToClass/blob/master/Dockerfile) que hemos escrito y analizaremos que buenas prácticas hemos seguido. Para documentarme acerca de las buenas prácticas a la hora de escribir Dockerfiles consulté [la siguiente página](https://lipanski.com/posts/dockerfile-ruby-best-practices). Como podemos ver, en esa página, se nos cuenta a lo largo de diversos apartados de forma muy clara que es lo que no se recomienda hacer y que debemos hacer en contraposición con una serie de ejemplos muy sencillos.

De esta forma, en mi Dockerfile podemos encontrar las siguientes buenas prácticas:
1. **Fijar la versión de la imagen base:** como podemos ver hemos especificado una versión de la imagen base, en nuestro caso: alpine:3.12.1 en vez de poner simplemente alpine ya que si hacemos esto último se nos descargará cada vez que construyamos el contenedor la última imagen de alpine y podríamos obtener fallos y no conseguiríamos el objetivo de tener un entorno reproducible.
2. **Utilizar imágenes oficiales o de confianza:** Se ha utilizado la imagen oficial de alpine que se puede encontrar en [Docker Hub](https://hub.docker.com/_/alpine).
3. **Especificar la versión de cada paquete instalado:** Con el mismo objetivo de conseguir un entorno reproducible se deben especificar las versiones de todos y cada uno de los paquetes que se van a instalar, de esta forma nuestro Dockerfile así lo hace:
   
   >RUN apk update &&\
    apk add --no-cache ruby=2.7.1-r3 \
    ruby-bundler=2.1.4-r1 \
    ruby-rake=2.7.1-r3

4. **Agrupar los comandos según la posibilidad de cambiar:** Se han puesto más arriba los comandos con menor posibilidad de cambiar y abajo los que más posibilidades de cambiar tienen.
5. **Minimizar lo máximo posible el tamaño, eligiendo una imagen base lo más pequeña posible:** Como podemos ver se ha optado por una imagen de Alpine que ofrece una imagen muy pequeña.
6. **Al configurar la instrucción CMD optar por el formato exec frente al formato shell:** Como podemos ver hemos optado por este formato porque hemos hecho:
   >CMD ["rake","test"]