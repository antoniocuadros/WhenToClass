## Gestor de versiones de Ruby: RBENV :small_orange_diamond:
Para la realización de este proyecto se está utilizando el gestor de versiones RBENV, podemos consultar la página oficial de este manejador de versiones en este [enlace](https://github.com/rbenv/rbenv) que nos lleva a su repositorio oficial apoyado por la comunidad.
RBENV nos permite implementar cada proyecto con nuestro entorno totalmente autónomo pudiendo elegir una versión específica de Ruby y las gemas necesarias para ejecutar nuestra aplicación, a diferencia de rvm, rbenv es bastante más ligero y aborda una mayor cantidad de versiones de este lenguaje así como permite cambiar la configuración global de Ruby por cada usuario.

### ¿Por qué RBENV?
Se ha elegido como gestor de versiones rbenv ya que aporta una gran flexibilidad, mayor incluso que rvm manejando las distintas versiones del lenguaje Ruby y además de una forma más sencilla a como se hace con rvm. Por otra parte presenta una serie de ventajas (frente a rvm) como:
- No necesita cargarse en la shell.
- No existe un fichero de configuración ya que lo único que nos interesa es con qué versión de Ruby queremos trabajar, haciendo su uso mucho más sencillo.
- Mucho más ligero.
- Simplicidad y facilidad de uso.

### Como instalar RBENV
En primer lugar clonamos el repositorio:

`git clone https://github.com/rbenv/rbenv.git ~/.rbenv`

Añadimos ~/.rbenv/bin a nuestro $PATH para poder acceder a rbenv desde la linea de comandos:

`echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile`

Ponemos a punto rbenv en nuestra shell:

`~/.rbenv/bin/rbenv init`

Instalamos ruby-build que es un plugin para manejar de forma más sencilla las versiones de Ruby (usando rbenv install):


`mkdir -p "$(rbenv root)"/plugins`
`$ git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build`

Ya podemos usar cualquier versión de ruby instalandola con:

`rbenv install X` siendo X la versión.
