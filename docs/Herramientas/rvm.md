## Gestor de versiones de Ruby: RVM :small_orange_diamond:
Para la realización de este proyecto se está utilizando el gestor de versiones RVM, podemos consultar la página oficial de este manejador de versiones en este [enlace](https://rvm.io/).
RVM nos permite implementar cada proyecto con nuestro entorno totalmente autónomo pudiendo elegir una versión específica de Ruby y las gemas necesarias para ejecutar nuestra aplicación.

### ¿Por qué RVM?
Se ha elegido como gestor de versiones RVM ya que aporta una gran flexibilidad manejando las distintas versiones del lenguaje Ruby y además de una forma muy sencilla.  Además tal y como mencionan en su página oficial, "RVM está constantemente evolucionando, gracias a los pull requests de la comunidad al proyecto". Se puede consultar el repositorio oficial [aquí](https://github.com/rvm/rvm).
### Como instalar RVM

En primer lugar debemos instalar las claves GPG que se utilizarán para verificar el paquete de instalación:

`gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`

Ahora instalamos la versión estable con: 

`\curl -sSL https://get.rvm.io | bash -s stable --ruby`

Hacemos (en mi caso):

`source /home/antculap/.rvm/scripts/rvm`

Y ya tenemos instalado RVM.
### Como usar RVM
En primer lugar listamos las versiones disponibles de Ruby:

`rvm list known`

Para instalar una versión:

`rvm install X` siendo X la versión que queremos instalar.

Par usar por defecto una versión hacemos:

`rvm --default use X` siendo X la versión que queremos por defecto.
