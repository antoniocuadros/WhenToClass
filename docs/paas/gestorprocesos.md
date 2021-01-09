## Gestor de procesos
En este punto del proyecto se ha decidido utilizar un gestor de procesos para realizar tareas como por ejemplo iniciar el servidor o pararlo.


Para elegir dicho gestor de tareas se han probado previamente algunos gestores.

Inicialmente se probó con **ProcMan** pensado para aplicaciones Ruby, un gestor de procesos open-source y puede accederse a su repositorio de github en el [siguiente enlace](https://github.com/adamcooke/procman). Su instalación ha resultado ser muy sencilla mediante la instalación de una gema. Para empezar a utilizar este gestor se ejecuta el comando `procman init` lo cual creará un archivo `Procfile` en el cual definiremos que hacer para las tareas 'start', 'stop' y 'restart'. A partir de definir lo anterior, con el comando `procman start`, si hemos configurado correctamente dicha tarea, iniciará el servidor de nuestra aplicación.


Seguidamente se probó con **PM2** también open-source y puede consultarse su repositorio [en el siguiente enlace](https://github.com/Unitech/pm2). Está pensado inicialmente para Node.js pero que como veremos a continuación también puede ser utilizado para nuestro proyecto en Ruby, consta con soporte para Linux, Windows y macOS. Su instalación también es muy sencilla. 

A diferencia de procman, en este caso para lanzar y parar aplicaciones nos encontramos con una sintaxis mucho más sencilla como por ejemplo en nuestro gestor de tareas podríamos hacer :
- `rake start` que contiene el siguiente comando `pm2 start 'rackup config.ru' --name 'api-whentoclass'`.
- `rake stop` que contiene lo siguiente: `pm2 stop api-whentoclass`. 

Podemos observar que se usa el comando rackup para iniciar el servidor, esto es debido a que comentamos en microservicios, mi microframework, Roda, hace uso de rack que se define a si mismo en su documentación como 'una interfaz modular de servidor web Ruby' que encapsula de forma muy sencilla todas las peticiones y respuestas HTTP y además la gran mayoría de (micro)frameworks de Ruby lo soportan como por ejemplo Hanami, Padrino, Sinatra y Roda entre otros.  

Adicionalmente en PM2 contamos con más opciones y muy interesantes como `pm2 ls` que devuelve de forma muy clara y atractiva la lista de aplicaciones iniciadas con PM2 y el estado en el que se encuentra entre otros datos. Además con `pm2 monit` podemos ver los logs de nuestra aplicación también de una forma muy clara. Como también indica su documentación la cual es muy extensa y útil ya que procede con muchos ejemplos encontramos que cuenta con soporte para contenedores simplemente ejecutando `npm install pm2 -g` se instalará PM2.

Por último se probó con **foreman**, y esta ha sido **mi elección como gestor de procesos**. Es también un gestor de procesos open-source y se puede consultar su repositorio en el [siguiente enlace](https://github.com/ddollar/foreman). 

La instalación de Foreman ha sido muy sencilla también ya que es una gema de Ruby, de esta forma se añade al gemfile simplemente. 

Hace uso de un Procfile, fichero en el cual defines que acción llevar a cabo cuando se ejecute `foreman start`.

Además permite la ejecución de más de un proceso del mismo tipo simultáneamente de la siguiente forma:

```
foreman start -c worker=2
```

Se ha decidio utilizar foreman porque es bastante ligero (no incluye tantas utilidades como PM2 por ejemplo), funciona de forma directa con Ruby instalando simplemente una gema (tenemos centralizadas todas las dependencias en dicho fichero) y su sintaxis es muy sencilla. Inicialmente se probó con PM2 pero su instalación resulta algo más compleja y a la hora de trabajar con Heroku me ha parecido más sencillo con Foreman.

De esta forma se ha definido un archivo Procfile que se ha renombrado a `foreman_config` y que le indica a foreman que hacer cuando se ejecuta la siguiente orden: `foreman start -f foreman_config`. Esta orden iniciará el servidor Rack que hemos comentado previamente y arrancará nuestra aplicación en el puerto 5000.

El archivo foreman_config contiene lo siguiente:

```
web: rackup config.ru -p 5000
```

Se ha definido una tarea en el gestor de tareas, en el fichero Rakefile de tal forma que haciendo simplemente `rake start` ejecuta foreman iniciando nuestra aplicación.