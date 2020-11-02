# Travis CI para integración continua
## ¿Qué es Travis CI?
Travis CI es un sistema de integración continua usado para construir y probar productos software alojados en GitHub.

## ¿Por qué Travis?
Se está utilizando Travis CI debido a la buena integración que posee con GitHub, ya que nos registramos directamente con GitHub haciendo que la vinculación del repositorio sea muy sencilla así como la configuración de la integración continua. Es muy sencillo activar builds automatizadas con cada cambio que realizamos en GitHub configurando un único fichero `.travis.yml`.

Además encontramos una gran cantidad de documentación oficial y muchísimos usuarios en todo internet que hacen uso de Travis y que contestan las dudas de otros usuarios dejando constancia de dichas soluciones para todas las personas que se encuentren ante el mismo problema. Todo esto, hace que la curva de aprendizaje sea muy pequeña.

## ¿Que hace nuestro fichero .travis.yml?

Nuestro fichero `.travis.yml` se puede consultar [aquí](https://github.com/antoniocuadros/WhenToClass/blob/master/.travis.yml). Este fichero hace lo siguiente:

En primer lugar se define el lenguaje que se va a utilizar, en este caso Ruby:

```
language: ruby
```

En segundo lugar cacheamos las dependencias, esto nos ahorrará algo de tiempo a la hora de ejecutarse bundle install ya que nos ahorramos el tiempo de descarga de las dependencias:

```
cache: bundler
```

Tiempo con las dependencias cacheadas (al final de la imagen a la derecha):

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/fichero/1.png)

Tiempo con las dependencias no cacheadas:

![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/fichero/2.png)

Podemos ver que no existe mucha diferencia a la hora de hacer `bundle install`, pero hay diferencia, pasamos de 1,30s (sin cachear) a 0,32s (cacheando dependencias).

Ahora mismo no es una diferencia muy significativa pero cuando el proyecto vaya creciendo y aumenten el número de dependencias podrá suponer una mayor diferencia, debido a esto se ha optado por seguir manteniendo en caché las dependencias.

A continuación indicamos todas las versiones de Ruby que funcionan con nuestro proyecto:

```
rvm:
  - 2.7.1
  - 2.7.2
  - 2.7.0
  - 2.6.0
  - 2.5.0
  - 2.4.0
  - 2.3.0
```

Podemos ver en la siguiente captura los tests pasando en dichas versiones:

![img3](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/fichero/3.png)