# Travis CI para integración continua

## Integración continua funcionando
[En este enlace](https://travis-ci.com/github/antoniocuadros/WhenToClass) se puede consultar la integración continua funcionando.

Se adjunta imagen:

![img6](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/fichero/6.png)

Para ver el proceso de registro en Travis CI y enlace con GitHub se puede consultar el [siguiente enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/register.md).

Podemos ver que cada vez que hacemos un push, se ejecuta Travis CI con el objetivo de ejecutar los tests:

![img7](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/fichero/7.png)


## ¿Qué es Travis CI?
Travis CI es un sistema de integración continua usado para construir y probar productos software alojados en GitHub.

## ¿Por qué Travis?
Se está utilizando Travis CI debido a la buena integración que posee con GitHub, ya que nos registramos directamente con GitHub haciendo que la vinculación del repositorio sea muy sencilla así como la configuración de la integración continua. Es muy sencillo activar builds automatizadas con cada cambio que realizamos en GitHub configurando un único fichero `.travis.yml`.

Además encontramos una gran cantidad de documentación oficial y muchísimos usuarios en todo internet que hacen uso de Travis y que contestan las dudas de otros usuarios dejando constancia de dichas soluciones para todas las personas que se encuentren ante el mismo problema. Todo esto, hace que la curva de aprendizaje sea muy pequeña.

## ¿Que hace nuestro fichero .travis.yml?

Para empezar a trabajar con Travis CI hemos necesitado crear el fichero y añadir ahí la configuración `.travis.yml` se puede consultar [aquí](https://github.com/antoniocuadros/WhenToClass/blob/master/.travis.yml). No obstante se presenta a continuación:

(se puede observar que se han añadido las ultimas versiones de cada serie, se ha probado localmente y funcionan, en Travis se muestran las pruebas con las primeras versiones de cada serie funcionando, se modificará la imagen cuando y documentación cuando posea créditos de Travis)

```
language: ruby

#Cacheamos las dependencias
cache: bundler

#Probamos con distintas versiones de ruby
rvm:
  - 2.7.2
  - 2.6.6
  - 2.5.8
  - 2.4.10
  - 2.3.8

#Para poder trabajar con bundler 2.1.4
before_install:
  - gem install bundler

#Se ejecutan los tests
script: rake test
```


Este fichero hace lo siguiente:

**En primer lugar** se define el lenguaje que se va a utilizar, en este caso Ruby:

```
language: ruby
```

**En segundo lugar** cacheamos las dependencias, esto nos ahorrará algo de tiempo a la hora de ejecutarse bundle install ya que nos ahorramos el tiempo de descarga de las dependencias:

```
cache: bundler
```

Tiempo con las dependencias cacheadas (al final de la imagen a la derecha):

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/fichero/1.png)

Tiempo con las dependencias no cacheadas:

![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/fichero/2.png)

Podemos ver que no existe mucha diferencia a la hora de hacer `bundle install`, pero hay diferencia, pasamos de 1,30s (sin cachear) a 0,32s (cacheando dependencias).

Ahora mismo no es una diferencia muy significativa pero cuando el proyecto vaya creciendo y aumenten el número de dependencias podrá suponer una mayor diferencia, debido a esto se ha optado por seguir manteniendo en caché las dependencias.

**En tercer lugar** indicamos todas las versiones de Ruby que funcionan con nuestro proyecto:

(se adjuntan las fotos de las versiones que se probaron antes de agotarse los créditos, en cuanto posea créditos adjuntaré las imágenes de Travis funcionando con las últimas versiones de cada serie)

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

En versiones anteriores a la 2.3.0 nuestro proyecto deja de funcionar:

![img4](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/fichero/4.png)

![img5](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/fichero/5.png)

Esto es debido a que nosotros tenemos que utilizar bundler en su versión 2.1.4 y dicha versión no es compatible con versiones anteriores a ruby 2.3.0, para versiones anteriores a ruby 2.3.0 debemos utilizar bundler 1.17.3.

**A continuación** ejecutamos:

```
before_install:
  - gem install bundler
```

Esto nos permite trabajar con bundler 2.1.4.

**En siguiente lugar** ejecutamos los tests:

```
script: rake test
```

Cuando hacemos un push vemos que en Travis CI se ejecutan los tests:

![img8](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/fichero/8.png)


### Nota
Como se puede observar parece que no estoy instalando las dependencias, pero esto no es así, no hace falta utilizar explicitamente la orden `bundle install` en nuestro fichero `.travis.yml` ya que se ejecuta de forma automática tal y como se indica en la [guía de Travis de como construir un proyecto escrito en Ruby](https://docs.travis-ci.com/user/languages/ruby/#dependency-management).

Vemos en la siguiente imagen como efectivamente, se instalan las dependencias:

![img9](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/fichero/9.png)


Las capturas se han sacado del [siguiente](https://travis-ci.com/github/antoniocuadros/WhenToClass/jobs/427121652) trabajo de Travis.
