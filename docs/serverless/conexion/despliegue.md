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

