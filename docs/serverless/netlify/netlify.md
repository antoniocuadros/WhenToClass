# Bot de telegram haciendo uso de funciones serverless en Netlify

Con el objetivo de cubrir las rúbricas tanto 3 como 4 se ha creado un bot de Telegram (podemos encontrarlo en el [siguiente enlace](https://t.me/ktengobot)) en Netlify haciendo uso de funciones serverless con el objetivo de conseguir un bot que nos permita obtener las tareas que tenemos que realizar de cada asignatura, y debido a que Netlify únicamente acepta los lenguajes JavaScript y Go se ha decidido elegir JavaScript ya que es un lenguaje que nunca he utilizado y he querido aprender a utilizarlo así como conocer un gestor de tareas básico como npm (así como gestor de paquetes) y una herramienta de tests como Jest. He decidido realizar dicho bot ya que me parece que resuelve un problema muy interesante como informar al estudiante que lo solicite de las tareas que hay pendientes de entregar.

A continuación se detalla como se ha construido dicho bot y que utilidad tiene. Se puede omitir la parte "Previo a la creación del bot" e ir al apartado "creación del bot" para ir a detalles concretos.

## Integración dentro del proyecto
Con el objetivo de continuar nuevas historias de usuarios e issues y debido a que se está utilizando otro lenguaje y herramientas diferentes se han hecho uso de los submódulos de git para integrarlo dentro del proyecto. De esta forma el bot se encuentra en otro repositorio que se puede consultar [aquí](https://github.com/antoniocuadros/TareasTelegramBot) pero a la vez se encuentra enlazado con el repositorio WhenToClass principal del proyecto al ser un submódulo (puede verse esto en el apartado del código y carpetas del proyecto como una carpeta con un símbolo especial). De esta forma he podido seguir HUs e issues aunque se encuentre en otro repositorio.

## Previo a la creación del bot: "Paradigmas" de bots de Telegram
Actualmente cuando nos encontramos ante la decisión de crear un bot de Telegram nos encontramos con dos opciones:

- **Polling**: Esta opción consiste en un programa que está constantemente "preguntando" a Telegram si existe algún mensaje y en caso de que exista procesará el mensaje y devolverá una respuesta de acuerdo al mensaje que ha recibido. Su traducción al español es "sondeo" debido a que está constantemente sondeando a ver si hay mensajes nuevos.

- **Webhooks**: Los webhooks, a diferencia del polling o long polling como se le suele conocer, no está constantemente preguntando por la existencia de mensajes, su funcionamiento se basa en definir lo que se conoce como webhook, que se pueden definir como eventos que desencadenan acciones. En este caso, cada vez que enviemos un mensaje, se activará un webhook y dicho webhook activará una función que procesará la petición y devolverá una respuesta de acuerdo a la petición. El esquema sería algo como lo siguiente:
  - usuario -> envía mensaje para que lo procese el bot -> se activa un webhook -> se activa la función que contiene el comportamiento del bot -> se procesa la petición y se devuelve una respuesta.

Teniendo esto en cuenta, y teniendo en cuenta también como funciona la facturación de los proveedores de servicios serverless (cobran normalmente por milisegundos de activación) es mucho mejor si queremos desplegar un bot de Telegram haciendo uso de funciones serverless hacer uso de la segunda opción Webhooks ya que solo se activará cuando le llegue una petición.

### Creación del bot
#### Plataforma
Para la creación del bot se ha hecho uso de la plataforma "Netlify" que nos permite de forma muy sencilla desplegar funciones como servicio de forma muy sencilla y con una muy buena integración con Github. Uno de los pocos problemas que le veo a esta plataforma es que únicamente soporta como lenguajes JavaScript y Go, pero no tiene por que ser malo, una oportunidad para aprender alguno de estos lenguajes.

#### Lenguaje de programación
Como se ha mencionado en el apartado anterior, Netlify únicamente admite como lenguajes a día de hoy JavaScript y Go, de esta forma, se ha decidido utilizar JavaScript con el objetivo de aprender un poco de este lenguaje y algunas de las herramientas que lo rodean como npm y Jest.

#### Código del bot
Para comenzar a desarrollar el bot, Netlify nos pide que creemos un fichero de configuración en nuestro proyecto para indicar donde se alojarán nuestras funciones o especificarlo en la propia configuración de Netlify, en mi caso se ha optado por la segunda opción y se ha indicado que las funciones se encuentran en la carpeta `functions`.
Una vez dentro de esta carpeta podemos encontrar varios ficheros:
- **data.json**: Fichero que contiene datos en formato JSON, contiene información de diversas asignaturas. Puede observarse que aunque el bot vaya a tratar de responder a peticiones acerca de tareas, se incorporan más datos de cada asignatura por si en algún momento se amplía la funcionalidad del mismo, ya que un bot de Telegram es muy útil y tener un bot completo puede ser muy interesante para facilitarte ciertas tareas. Se puede consultar [aquí](https://github.com/antoniocuadros/TareasTelegramBot/blob/main/functions/data.json).
- **tareas.js**: Este fichero contiene una función que será la encargada de leer el fichero comentado anteriormente y ser capaz de localizar las tareas que se están pidiendo y devolverlas con cierto formato.Se puede consultar [aquí](https://github.com/antoniocuadros/TareasTelegramBot/blob/main/functions/tareas.js).
- **ktengo.js**: Fichero que contiene la mayor parte de la lógica del bot, se encarga de extraer la información de la petición y posteriormente generar una respuesta.Se puede consultar [aquí](https://github.com/antoniocuadros/TareasTelegramBot/blob/main/functions/ktengo.js).


Centremonos en el fichero **ktengo.json** que contiene lo más importante relacionado con el bot (no se muestra todo el código, únicamente las partes más destacadas [aquí](https://github.com/antoniocuadros/TareasTelegramBot/blob/main/functions/ktengo.js) encontramos todo el código).

La función principal, la función serverless, tiene el siguiente formato en netlify: `exports.handler = async function(event, context)`.
Esta función se encarga de extraer la información que nos aporta el evento, procesarla, buscar que acción realizar y por último devolver una respuesta haciendo uso del método anteriormente comentado.

De esta forma cuando se activa el webhook, extraemos la información necesaria de la siguiente forma:


```
 let body = JSON.parse(event.body);
 let {chat, text} = body.message;
```

Como podemos ver extraemos tanto "chat" como "text", chat lo usaremos más adelante para conseguir el id del chat con "chat.id" y text contiene el mensaje que nos ha enviado el usuario (el comando).


Decidimos que hacer en función del mensaje recibido, para ello tenemos un switch que nos permite diferenciar entre las distintas acciones: 

```
 if (text && text.charAt(0) == '/'){ //Contiene texto el mensaje, será el comando
            let a_devolver = '';
  switch (text) {
                  case "/ktengo":
                    a_devolver = lib.getAsignaturas();
                    break;
                  case "/ktengoIV":
                    a_devolver = lib.getAsignaturas("IV");
                    break;
                  case "/ktengoDAI":
                    a_devolver = lib.getAsignaturas("DAI");
                    break;
                  case "/ktengoSPSI":
                    a_devolver = lib.getAsignaturas("SPSI");
                    break;
                  default:
                    a_devolver = "Usa /ktengo para saber que tareas tienes que realizar y para consultas más concretas: \n/ktengoIV para obtener las tareas a realizar de IV. \n/ktengoDAI para obtener las tareas a realizar de DAI. \n/ktengoSPSI para obtener las tareas a realizar de SPSI."
                    break;
              }
    ...
 }
```

Como podemos ver tenemos tres comandos:
- **/ktengo**: obtiene las tareas a realizar de todas las asignaturas registradas.
- **/ktengoIV**: obtiene las tareas para la asignatura IV.
- ...
En este switch podemos ver que se ha hecho uso de una nueva función, getAsignaturas, que lo que hace es obtener las tareas de todas las asignaturas si no tiene parámetros, o de una determinada si se pasa como parámetro. Se encuentra en el fichero [tareas.js](https://github.com/antoniocuadros/TareasTelegramBot/blob/main/functions/tareas.js).

Por último envía la respuesta de la siguiente forma:

```
  return {
    statusCode: 200,
    body: JSON.stringify({text:a_devolver, method:'sendMessage', chat_id:chat.id}),
    headers:{
        'Content-Type': 'application/json; charset=utf-8'
    }
```
Devolvemos un código 200 equivalente a "ok".
Luego devolvemos el mensaje que hemos formado y que se encuentra en la variable "a_devolver", indicamos que el método a utilizar es "sendMessage" y el id del chat donde devolver la respuesta.

### Estableciendo el webhook
Por último debemos establecer el webhook y ya el bot entraría en funcionamiento. Se puede hacer realizando una petición HTTP a la siguiente dirección `https://api.telegram.org/bot<TOKEN_BOT>/setWebHook?url=<URL_NETLIFY>`. Si todo ha salido bien nos debe devolver una respuesta como la siguiente:
`{"ok":true,"result":true,"description:"Webhook was set"}`, en mi caso URL_NETLIFY ha sido: `https://ktengo.netlify.app/.netlify/functions/ktengo`


### Prueba de funcionamiento
Si se desea probar se puede hacer a través del siguiente [enlace](https://t.me/ktengobot).
Nada más iniciar un chat con el bot podemos ver que salta el default del switch ya que se invoca el comando /start:

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/serverless/images/8.png)

Si ponemos el resto de comandos:

![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/serverless/images/9.jpeg)


### Tests del código
Siguiendo las buenas prácticas que llevamos realizando en la asignatura, se han realizado tests sencillos para aprender a utilizar Jest que se pueden encontrar en el siguiente [fichero](https://github.com/antoniocuadros/TareasTelegramBot/blob/main/test/bot.test.js) y además en npm se ha añadido una tarea para ejecutarlos de tal manera que si hacemos `npm test` se nos ejecutarán de la siguiente forma:

```
➜  TareasTelegramBot git:(main) npm test

> TareasTelegramBot@1.0.0 test /home/antculap/Desktop/WhenToClass_Updated/WhenToClass/TareasTelegramBot
> jest

 PASS  test/bot.test.js
  ✓ Debemos poder obtener tareas IV (2 ms)
  ✓ Debemos poder obtener tareas de todas las asignaturas definidas (1 ms)

Test Suites: 1 passed, 1 total
Tests:       2 passed, 2 total
Snapshots:   0 total
Time:        1.033 s
Ran all test suites.

```
