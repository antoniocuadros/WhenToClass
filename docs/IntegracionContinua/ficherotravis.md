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

En segundo lugar cacheamos las dependencias, esto nos ahorrará algo de tiempo a la hora de ejecutarse bundle install:

```
cache: bundler
```

Tiempo con las dependencias cacheadas:


Tiempo con las dependencias no cacheadas:


## Pruebas de rendimiento usando caché
