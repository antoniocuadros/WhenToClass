# Justificación conexión entre gitHub y Vercel/Netlify
En este apartado se va a justificar el despliegue correcto y funcionando así como la conexión entre el repositorio de GitHub y Vercel/Netlify para el despliegue continuo.

## Vercel
El despliegue en vercel ha sido sencillo siguiendo los pasos de la documentación oficial de vercel. Para desplegarlo hemos tenido que crear una carpeta /api donde alojar todo el código de la función serverless ya que así nos lo indicaba la documentación. Se puede comprobar que funciona la función accediendo por ejemplo al siguiente [enlace](https://when-to-class.vercel.app/api/enlace?asignatura=IV&m=p&d=m).

La conexión entre Vercel y GitHub también ha sido muy sencilla de realizar ya que en vercel me he registrado directamente haciendo uso de mi cuenta de GitHub y he importado mi propio repositorio directamente (donde he añadido la carpeta api para trabajar con Vercel). De esta forma, al importar mi repositorio, Vercel automáticamente añade una GitHub App de forma parecida a lo que pasaba con Travis CI. De esta forma conseguimos que cada vez que hacemos un push a nuestro repositorio, Vercel automáticamente hará un deploy de la función serverless, y además podremos saber desde el repositorio si falla ya que se notifica de igual forma que lo hace tanto Travis CI como Circle CI en el propio repositorio.

GitHub App: 


![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/serverless/images/conexion1.png)

Checks pasando:


![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/serverless/images/conexion2.png)


Vercel deploys relacionados con cada push:


![img3](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/serverless/images/conexion3.png)



## Netlify
El despliegue en Netlify también ha sido bastante sencillo. La función que se ha programado en Netlify como ya se comentará más adelante en su correspondiente documento, es un bot de telegram que nos permite conocer que tareas hay que realizar de cada asignatura. Como se ha programado en un lenguaje diferente (JavaScript) ya que Netlify únicamente admite JavaScript y Go, y se han usado herramientas diferentes como npm y Jest, se ha tomado la decisión de apartarlo a un repositorio diferente.


No obstante dicho repositorio se ha conectado correctamente con Netlify y a su vez se ha integrado correctamente en el proyecto WhenToClass haciendo uso de los submódulos de git para poder continuar las HUs e issues de este repositorio (WhenToClass) aunque se trate de un repositorio diferente.


Conectar GitHub con Netlify ha sido muy parecido a lo realizado con Vercel, ya que nos hemos registrado con GitHub y posteriormente hemos importado el repositorio de GitHub. Para alojar la función serverless, Netlify requiere que especifiquemos un directorio, en nuestro caso hemos utilizado el directorio functions y se lo hemos especificado en la configuración de Netlify (la alternativa era crear un fichero de configuración .toml).

De forma idéntica se ha instalado en el repositorio una GitHub App, pero en este caso de Netlify:


![img4](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/serverless/images/conexion4.png)


Gracias a esa GitHubb App cada vez que hacemos push se buildea el proyecto en Netlify, podemos observar en la siguiente foto que las builds están relacionadas con los commits en los que se ha hecho push:


![img5](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/serverless/images/conexion5.png)