## Gestor de procesos
En este punto del proyecto se ha decidido utilizar un gestor de procesos para realizar tareas como por ejemplo iniciar el servidor o pararlo.


Para elegir dicho gestor de tareas se han probado previamente algunos gestores.

Inicialmente se probó con **ProcMan** pensado para aplicaciones Ruby, un gestor de procesos open-source y puede accederse a su repositorio de github en el [siguiente enlace](https://github.com/adamcooke/procman). Su instalación ha resultado ser muy sencilla mediante la instalación de una gema. Para empezar a utilizar este gestor se ejecuta el comando `procman init` lo cual creará un archivo `Procfile` en el cual definiremos que hacer para las tareas 'start', 'stop' y 'restart'. A partir de definir lo anterior, con el comando `procman start`, si hemos configurado correctamente dicha tarea, iniciará el servidor de nuestra aplicación.


Seguidamente se probó con **PM2** también open-source y puede consultarse su repositorio [en el siguiente enlace](https://github.com/Unitech/pm2). Está pensado inicialmente para Node.js pero que como veremos a continuación también puede ser utilizado para nuestro proyecto en Ruby, consta con soporte para Linux, Windows y macOS. Su instalación también es muy sencilla. 

A diferencia de procman, en este caso para lanzar y parar aplicaciones nos encontramos con una sintaxis mucho más sencilla como por ejemplo la que hemos utilizado en nuestro gestor de tareas para la tarea `rake start` que contiene el siguiente comando `pm2 start 'rackup config.ru' --name 'api-whentoclass'` o la tarea `rake stop` que contiene lo siguiente: `pm2 stop api-whentoclass`. Podemos observar que se usa el comando rackup para iniciar el servidor, esto es debido a que comentamos en microservicios, mi microframework, Roda, hace uso de rack que se define a si mismo en su documentación como 'una interfaz modular de servidor web Ruby' que encapsula de forma muy sencilla todas las peticiones y respuestas HTTP y además la gran mayoría de (micro)frameworks de Ruby lo soportan como por ejemplo Hanami, Padrino, Sinatra y Roda entre otros.  

Como podemos ver es una sintaxis muy sencilla y fácil de entender.

Adicionalmente en PM2 contamos con más opciones y muy interesantes como `pm2 ls` que devuelve de forma muy clara y atractiva la lista de aplicaciones iniciadas con PM2 y el estado en el que se encuentra entre otros datos.

Además con `pm2 monit` podemos ver los logs de nuestra aplicación también de una forma muy clara.

Como también indica su documentación la cual es muy extensa y útil ya que procede con muchos ejemplos encontramos que cuenta con soporte para contenedores simplemente ejecutando `npm install pm2 -g` se instalará PM2.


Por todo lo comentado y debido a que me ha parecido más complicada la sintaxis de ProcMan así como por poseer una documentación bastante más pobre y que PM2 está constantemente recibiendo actualizaciones ya que en su repostorio vemos cambios frecuentes, por ejemplo en este momento el último cambio ocurrió hace 22 días, me he decidido a utilizar PM2.