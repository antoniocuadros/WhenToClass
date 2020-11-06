# Buenas prácticas a seguir con Travis debido al sistema de créditos

Este documento se escribe a partir de haber agotado los créditos de Travis tal y como se puede ver en la siguiente imagen:

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/buenaspracticas/1.png)

Como podemos ver Travis cuenta con un sistema de créditos que se agota en función de lo que se comenta en la siguiente imagen:

![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/buenaspracticas/2.png)

Esto ha ocurrido debido a que se han realizado una serie de acciones que podrían haberse realizado de mejor forma tal y como se van a comentar en los apartados siguientes.

## Cuando hacer push

Uno de los principales problemas por los que se han agotado los créditos es debido a que se han realizado demasiados push y en consecuencia se ha ejecutado travis muchas veces.

Se puede reducir el número de push realizados con una práctica muy sencilla, agrupar varios commits en un push en vez de hacer para cada commit un push.

## Versiones a probar

Cuando probamos distintas versiones del lenguaje para ver cuáles soporta nuestra aplicación podríamos probar por ejemplo en el caso de ruby las versiones 2.7.2, 2.7.1, 2.7.0, 2.6.0... Esto es un problema con el sistema de créditos de Travis ya que estará ejecutando durante más tiempo y en consecuencia gastando más créditos.

Para solucionar esto, sería suficiente con probar con las últimas versiones de cada serie, en la serie 2.7 por ejemplo sería suficiente con probar la versión 2.7.2

## Posibilidad de ejecutar los tests localmente
Otra posibilidad es ejecutar los tests de travis de forma local. Para ello estoy investigando los siguientes enlaces para conseguir ponerlo a funcionar:

- [Enlace 1](https://gist.github.com/fulldecent/d84cd1abdcc6930865d1b862c4aed917)
- [Enlace 2](https://medium.com/google-developers/how-to-run-travisci-locally-on-docker-822fc6b2db2e)


## Hacer que Travis no se ejecute
Si queremos que Travis no se ejecute, podemos añadir al mensaje del commit `[skip ci]`. Esto es muy útil cuando estamos haciendo documentación y hacemos push y no necesitamos que se ejecute Travis.