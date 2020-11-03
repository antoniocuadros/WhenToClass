# Aprovechamiento del contenedor en sistemas de Integración Continua
Como ya hemos visto anteriormente se ha hecho uso de tres sistemas de integración continua como es Travis CI, Circle CI y GitHub Actions.


No en todos se ha hecho uso del contenedor, aunque fácilmente se habría podido usar el contenedor en el sistema que no se ha hecho uso pero se ha hecho así por un motivo. Se detalla esto a continuación.


De los tres sistemas, se ha hecho uso del contenedor para ejecutar los tests tanto en Circle CI como en la action de GitHub.

## Circle CI
En este sistema de integración continua como ya se ha comentado se ha hecho uso del contenedor para ejecutar los tests y así nos evitamos tener que configurar de nuevo la instalación y gestión de dependencias de acuerdo a la sintaxis del fichero de configuración del sistema de integración continua ya que todo está configurado en el contenedor. 


El uso del contenedor en este sistema de integración continua ha sido muy sencillo de incorporar y **no ha sido necesario ninguna adaptación del contenedor** ya que todo ha funcionado correctamente y de acuerdo a lo especificado en el Dockerfile.


Se ha hecho uso del contenedor de la siguiente forma:

```
steps:
      - checkout
      - run: docker build -t whentoclasstests:v2 .
      - run: docker run -t -v `pwd`:/test whentoclasstests:v2
```


## GitHub Actions
De forma semejante a lo que se ha comentado en el apartado de Circle CI, se ha hecho uso del contenedor para ejecutar los tests ya que todo está configurado en ese contenedor para llevar a cabo esta tarea. 

El uso del contenedor también ha sido muy sencillo y **tampoco ha sido necesaria ninguna adaptación del contenedor** ya que todo ha funcionado correctamente de acuerdo a lo especificado en el Dockerfile.


Se ha hecho uso del contenedor de la siguiente forma:

```
 name: docker build
          run: docker build -t ghcr.io/antoniocuadros/whentoclasstests:v2 .
        - name: exec test
          run: docker run -t -v `pwd`:/test ghcr.io/antoniocuadros/whentoclasstests:v2
```
## Travis CI
En Travis CI no se ha hecho uso del contenedor. Esto es debido a que se ha querido probar con distintas versiones de Ruby para saber en qué versiones funciona nuestra aplicación. 


De esta forma se ha configurado Travis para que se haga todo de forma análoga a lo que hace el contenedor (instalar dependencias, ejecutar los tests) pero probando con varias versiones del lenguaje, hasta que hemos encontrado las versiones en las que funciona correctamente nuestra aplicación.

