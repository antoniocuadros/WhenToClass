# Uso del gestor de tareas en Integración Continua
Nosotros hemos utilizado como sistemas de integración continua principalmente Travis CI y Circle CI aunque como ya se ha comentado, también se ha escrito una GitHub action que hace pasar los tests y hace push a GitHub Container Registry.

En todos estos sistemas, en algún punto será necesario ejecutar la orden correspondiente del gestor de tareas que ejecutará los tests. En nuestro caso, se ha utilizado como gestor de tareas rake tal y como se ha comentado en documentos como [este](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Herramientas/rake.md). En concreto en algún punto deberemos ejecutar la orden `rake test` para poder ejecutar los tests.

Recordamos que esta tarea del gestor de tareas, ejecutará los tests sobre los métodos de las clases Asignatura y GestorAsignaturas.

## Travis CI


## Circle CI


## GitHub Action