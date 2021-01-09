## Funcionamiento correcto del despliegue en el PaaS. No se puede devolver ningún status 500.
Puede probarse lo que se va a comentar a continuación sobre la api alojada en el [siguiente enlace](https://whentoclass.herokuapp.com/).

### Códigos de estado utilizados
Cuando una operación tenga éxito, se adjuntará el código de estado: 200.
Cuando una operación falle porque no se encuentra un recurso, se adjuntará el código de estado: 404.
Se hace de la siguiente forma:

Para éxito:
```
response.status = 200
                        
```
Fallo en la petición, se ha podido comunicar con el microservicio pero no existe el recurso que se está solicitando.
```
response.status = 404
```
#### Todas las rutas de nuestra API
```
/status # Para comprobar si está activo
```

```
/grados # Para obtener (GET) todos los grados
```

```
/grado/$ID # Añadir (PUT) un grado
```

```
/grado/$ID # Eliminar (DELETE) un grado identificado por $ID
```

```
/grado/$ID # Consultar (GET) un grado identificado por $ID
```

```
/grado/$ID/asignatura/$ID2 # Consultar (GET) una asignatura identificada por $ID2 perteneciente al grado #$ID
```

```
/grado/$ID/asignatura/$ID2 # Eliminar (DELETE) una asignatura identificada por $ID2 perteneciente al grado #$ID
```

```
/grado/$ID/asignatura/$ID2 # Añade (PUT) una asignatura al grado #$ID
```

```
/grado/$ID/asignatura/$ID2/horario?grupo=X # Consulta (GET) el horario de una asignatura de un grado para un grupo de prácticas X.
```

```
/grado/$ID/asignatura/$ID2/enlace?grupo=X # Consulta (GET) el enlace de una clase online de una asignatura de un grado para un grupo de prácticas X.
```

```
/grado/$ID/asignatura/$ID2/enlace?grupo=X # Consulta (GET) el enlace de una clase online de una asignatura de un grado para un grupo de prácticas X.
```

```
/grado/$ID/asignatura/$ID2/turno?turno=X&mes=Y # Consulta (GET) el turno de presencialidad de una asignatura de un grado para un turno X y un mes Y.
```

```
/grado/$ID/asignaturas # Obtiene (GET) todas las asignaturas de un grado identificado por $ID
```

De esta forma podemos ver que funciona por ejemplo pidiéndole todos los grados previamente añadidos con PUT a la url /grado/$ID:

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/paas/images/14.png)