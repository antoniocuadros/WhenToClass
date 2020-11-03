# Circle CI para integración continua

## Integración continua funcionando

En la siguiente imagen podemos ver la integración continua funcionando con Circle CI:

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/circleci/1.png)

El proceso de registro en Circle CI es muy similar al proceso de registro en Travis, visitamos su página [web oficial](https://circleci.com/) y desde ahí nos registramos con GitHub y activamos el repositorio que deseemos, en este caso, el repositorio [WhenToClass](https://github.com/antoniocuadros/WhenToClass).

Podemos ver que cada vez que hacemos un push, se ejecuta Circle CI con el objetivo de ejecutar los tests:

![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/circleci/2.png)

## ¿Qué es Circle CI?
Circle CI es un sistema de integración continua usado para construir y probar productos software alojados en GitHub y Bitbucket.

## ¿Por qué Circle CI?
Se está utilizando Circle CI debido a que al igual que Travis posee una buena integración con GitHub. Gracias a esta integración con GitHub es muy sencillo registrarnos y activar la integración continua que ofrece este sistema en nuestros repositorios. Además la configuración es muy sencilla haciendo uso del fichero `config.yml` que se encuentra en la carpeta `.circleci` y puede consultarse en el [siguiente enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/.circleci/config.yml)

En un primer momento se empezó a utilizar [Shippable](https://www.shippable.com/) pero debido a una gran cantidad de problemas que tuve utilizándolo, que se pueden observar en la gran cantidad de commits realizados (que van desde [este](https://github.com/antoniocuadros/WhenToClass/commit/6cdafd034e299b6669bcbd9cb63c7fe1803887f0)  a [este otro](https://github.com/antoniocuadros/WhenToClass/commit/d00e223e48c9ff46ce83ac61938cd61c44b01e2c)) intentando solucionar problemas, decidí dejarlo y buscar otro sistema. Una de las principales razones por las que decidí dejar de intentar configurar Shippable fue debido a que mi objetivo era usar Shippable para construir el contenedor y ejecutar los tests en el mismo a diferencia de lo que hacemos en Travis que ejecutamos sin contenedor para probar todas las versiones posibles del lenguaje y para trabajar con Docker no encontré suficiente documentación ni oficial ni por parte de la comunidad y me costaba mucho avanzar. [Aquí](https://app.shippable.com/github/antoniocuadros/WhenToClass/runs/32/1/console) se puede ver una de las pruebas fallando en Shippable para dejar constancia de su uso.

En cambio, Circle CI, nada más introducirnos en su [página web](https://circleci.com/product/#features) asguran un "soporte para Docker de primera clase" y efectivamente, el trabajo con Docker ha sido muy sencillo para poder tanto construir el contenedor como para ejecutar los tests dentro del mismo en gran parte debido a la muy buena documentación que encontramos sobre Docker en su página.

## ¿Que hace nuestro fichero .circleci/config.yml?