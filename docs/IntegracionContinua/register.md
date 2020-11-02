# Proceso de registro en Travis y vinculación con GitHub
## Darnos de alta en Travis CI 
(Aclaración: inicialmente se realizó el registro en travis-ci.org y posteriormente se migró todo a travis-ci.com ya que el primero nombrado está obsoleto)

En primer lugar para empezar a trabajar con Travis CI debemos dirigirnos a su página oficial, la cual encontramos en el [siguiente enlace](https://travis-ci.com/).

Una vez dentro de la página web nos registramos haciendo click en "Sign Up": 

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/register/1.png)

Una vez habiéndole dado a "Sign Up" se nos redirige a lo siguiente, debemos darle a "autorize travis-ci":

![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/register/2.png)

Una vez hecho esto se nos pide introducir la contraseña de GitHub, la introducimos y con esto ya estaríamos registrados.

![img3](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/register/3.png)

## Activar el repositorio en el que se vaya a aplicar la integración continua

A la izquieda en la misma página de bienvenida podemos encontar un símbolo "+" para añadir travis-ci a nuestro repositorio:

![img4](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/register/4.png)

Ahora en la nueva página a la que hemos sido redirigidos, añadimos travis-ci a nuestro repositorio de la siguiente forma:

![img5](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/register/5.png)

Lo que hemos conseguido con esto es añadir un webhook de GitHub en nuestro repositorio de forma automática (se muestra el hook de travis-ci.org, ya que inicialmente se registró en este sitio que está obsoleto y posteriormente se migró a travis-ci.com)

![img6](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/register/6.png)

A continuación se muestra la integración continua funcionando en travis-ci.com:

![img7](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/IntegracionContinua/images/register/7.png)