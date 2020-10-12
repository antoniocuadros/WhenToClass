## Bundler :small_orange_diamond:
Para la realización de este proyecto se está utilizando como herramienta de gestión de dependencias (en el caso de Ruby son conocidas como gemas) Bundler. Es una herramienta que permite realizar un seguimiento de las gemas así como su instalación. Es un proyecto apoyado por la comunidad que realiza aportaciones a su [repositorio oficial](https://github.com/rubygems/rubygems/tree/master/bundler) de forma constante para mejorarlo de forma continuada. Dada una lista de gemas, Bundler puede tanto descargarlas como instalarlas así como otras gemas necesarias para las gemas que se han indicado. Además proporciona facilidades para actualizar las gemas instaladas y registra las versiones que se encuentran instaladas.
### ¿Por qué Bundler?
Se ha elegido Bundler debido a que es una herramienta muy extendida en lo que a desarrollo en Ruby se refiere debido a su sencillez de utilización e instalación así como debido a la gran cantidad de documentación existente sobre Bundler y todas las ventajas mencionadas en el apartado anterior, ya que aporta una gran flexibilidad gracias a todas las opciones comentadas.
### Como instalar Bundler
La instalación de Bundler es muy sencilla:

`gem install bundler`

Para ponerlo a punto:

`bundle init`

Si queremos por ejemplo trabajar con RSPEC haríamos:

`bundle add rspec`

`bundle install`

`bundle exec rspec`

Para desinstalar una gema:

`gem uninstall bundler`
