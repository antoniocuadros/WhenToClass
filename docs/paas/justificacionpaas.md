## Descripción y justificación de las herramientas usadas para desplegar la aplicación en en PaaS

### ¿Por qué Heroku?
A la hora de desplegar mi microservicio he estado barajando tanto el uso de Openshift como de Heroku pero me he decidido por Heroku por los siguientes motivos:

- Heroku desde un unicio estuvo pensado para Ruby, el lenguaje que se está utilizando en este proyecto, gracias a esto existe una gran cantidad de [documentación](https://devcenter.heroku.com/articles/getting-started-with-ruby#declare-app-dependencies) para este lenguaje en Heroku, no obstante en la actualidad cuenta con soporte para una gran cantidad de lenguajes.
- El CLI de Heroku es muy sencillo de instalar y posee una documentación muy detallada.
- Set-up del proyecto sencillo gracias al CLI de Heroku. En pocos minutos se puede tener desplegada una aplicación.
- Posibilidad de desplegar localmente el microservicio fácilmente con la orden `heroku local` del CLI.
- Posibilidad de visualizar los logs de nuestra aplicación con el comando `heroku logs --tail`, esto incluye tanto los logs por defecto de heroku como todas las salidas por pantalla de nuestra aplicación, que como vimos en el hito anterior, configuramos nuestro propio sistema de logs por pantalla.
- Posibilidad de escalar sencillamente la aplicación. En un primer momento se utiliza un único Dyno que es un entorno virtual sobre Unix donde se ejecuta nuestro microservicio, pero se pueden aumentar el número de Dynos facilmente con el siguiente comando del CLI: `heroku ps:scale web=2` para por ejemplo establecer dos Dynos.
- Declaración e instalación de las dependencias de la aplicación de forma muy sencilla. En mi caso, se declaran en el gemfile y automáticamente al construir Heroku la aplicación ejecutará `bundle install` para instalar dichas dependencias.
- Heroku posee una gran cantidad de addons entre ellos los más interesantes son aquellos de bases de datos y servicios de logs.
- Sencilla definición de variables de configuración secretas, en mi caso se ha utilizado una que contiene el string de conexión a la base de datos.

#### ¿Estados Unidos o Europa?
Se ha probado a desplegar tanto la aplcación en Europa como en Estados Unidos obteniendo muchos mejores resultados de latencia en Europa. Lo podemos ver gracias a los logs:

Estados Unidos:
```
2021-01-09T11:12:04.365231+00:00 heroku[router]: at=info method=GET path="/status" host=whentoclass.herokuapp.com request_id=6e66e6d6-4c5b-4f3d-b2b1-3a370edfde5c fwd="2.138.45.192" dyno=web.1 connect=1ms service=443ms status=200 bytes=190 protocol=https
2021-01-09T11:12:04.352782+00:00 app[web.1]: "09_01_2021 11:12:04 GET /status HTTP/1.1 200"
```

Europa:
```
2021-01-09T11:29:00.762010+00:00 heroku[router]: at=info method=GET path="/status" host=whentoclasseurope.herokuapp.com request_id=290b9234-0d91-4122-9c50-48e711c5a8ea fwd="2.138.45.192" dyno=web.1 connect=0ms service=174ms status=200 bytes=190 protocol=https
2021-01-09T11:29:00.762170+00:00 app[web.1]: "09_01_2021 11:29:00 GET /status HTTP/1.1 200"
```

Como podemos ver la latencia en Estados Unidos ha sido de 443ms mientras que en Europa de 174ms eligiendo de esta manera alojarlo en Europa.

### Como desplegar esta aplicación
El despliegue de la aplicación gracias al CLI de Heroku es muy sencillo, se deben seguir los siguientes pasos:
- Debemos hacer un fork de este repositorio.
- Tener instalado el CLI de Heroku y ejecutar los siguientes comandos para crear una aplicación en Heroku:
  - `heroku login`
  - Clonar localmente el repositorio.
  - `heroku create nombre-aplicacion`
  - Configurar la variable de configuración de Heroku de la base de datos: `heroku config:set MONGODB_URI="..."`
  - `git push heroku main`

- Una vez hecho esto ya estará desplegada esta misma aplicación y con el comando `heroku open` podremos acceder a ella.