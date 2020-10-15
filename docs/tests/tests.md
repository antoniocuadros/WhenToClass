## Tests unitarios
A continuación se muestran capturas de pantalla que muestran el correcto funcionamiento de los tests, siendo ejecutados con la herramienta rake.

Si queremos saber que tests tenemos preparados para ejecutar debemos hacer:

`rake --tasks`

y debemos fijarnos aquellos en los que indica "Run tests". Como podemos ver tenemos dos conjuntos de tests:
 - testunitariosasignaturas: que ejecutará los tests de la clase Asignatura.
 - testunitariosgestorasignaturas: que ejecutará los tests de la clase GestorAsignaturas.

Para ejecutar cada una de estos conjuntos de tests podemos hacer:

- `rake testunitariosasignaturas`
- `rake testunitariosgestorasignaturas`

Si queremos ejecutar todos haremos:

`rake test`
