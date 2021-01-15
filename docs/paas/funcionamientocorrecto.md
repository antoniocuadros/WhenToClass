## Funcionamiento correcto del despliegue en el PaaS. No se puede devolver ningún status 500.
Puede probarse lo que se va a comentar a continuación sobre la api alojada en el siguiente enlace:

Enlace API alojada en Estados Unidos: https://whentoclass.herokuapp.com/
Enlace API alojada en Europa: https://whentoclasseurope.herokuapp.com/

Comentar que nos quedaremos con la segunda debido a su menor latencia como se verá posteriormente

### Códigos de estado utilizados
Cuando una operación tenga éxito, se adjuntará el código de estado: 200.
Cuando una operación falle porque no se encuentra un recurso, se adjuntará el código de estado: 404.
Se hace de la siguiente forma:

Para éxito:
```
response.status = 200
                        
```

Para éxito al crear recurso:
```
response.status = 201
                        
```

Fallo en la petición, se ha podido comunicar con el microservicio pero no existe el recurso que se está solicitando.
```
response.status = 404
```
### Todas las rutas de nuestra API y relación con HUs
Nuestra API ha seguido las buenas prácticas comentadas en el hito anterior en el [siguiente documento](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/microservicios/rub2.md#rutas) en el apartado rutas, y se ha corregido con respecto al hito anterior que los POST ahora son PUT ya que se conoce el URI y que ahora se accede con el nombre en plural a grados en vez de grado.

[HU15](https://github.com/antoniocuadros/WhenToClass/issues/98) Como usuario del microservicio me gustaría comprobar que está disponible
```
/status # Para comprobar si está activo
```

[HU10](https://github.com/antoniocuadros/WhenToClass/issues/71) Como administrador de una universidad tendría que poder añadir, eliminar grados y consultarlos
```
/grados # Para obtener (GET) todos los grados
```

[HU10](https://github.com/antoniocuadros/WhenToClass/issues/71) Como administrador de una universidad tendría que poder añadir, eliminar grados y consultarlos
```
/grados/$ID # Añadir (PUT) un grado
```

[HU10](https://github.com/antoniocuadros/WhenToClass/issues/71) Como administrador de una universidad tendría que poder añadir, eliminar grados y consultarlos
```
/grados/$ID # Eliminar (DELETE) un grado identificado por $ID
```

[HU10](https://github.com/antoniocuadros/WhenToClass/issues/71) Como administrador de una universidad tendría que poder añadir, eliminar grados y consultarlos
```
/grados/$ID # Consultar (GET) un grado identificado por $ID
```

[HU4](https://github.com/antoniocuadros/WhenToClass/issues/28) Como usuario debo poder seleccionar, añadir y eliminar una asignatura
```
/grados/$ID/asignatura/$ID2 # Consultar (GET) una asignatura identificada por $ID2 perteneciente al grado #$ID
```

[HU4](https://github.com/antoniocuadros/WhenToClass/issues/28) Como usuario debo poder seleccionar, añadir y eliminar una asignatura
```
/grados/$ID/asignatura/$ID2 # Eliminar (DELETE) una asignatura identificada por $ID2 perteneciente al grado #$ID
```

[HU4](https://github.com/antoniocuadros/WhenToClass/issues/28) Como usuario debo poder seleccionar, añadir y eliminar una asignatura
```
/grados/$ID/asignatura/$ID2 # Añade (PUT) una asignatura al grado #$ID
```

[HU1](https://github.com/antoniocuadros/WhenToClass/issues/8) Como usuario, quiero obtener el horario de una asignatura 
```
/grados/$ID/asignatura/$ID2/horario?grupo=X # Consulta (GET) el horario de una asignatura de un grado para un grupo de prácticas X.
```

[HU6](https://github.com/antoniocuadros/WhenToClass/issues/47) Como usuario quiero poder obtener los enlaces de las clases online de una determinada asignatura
```
/grados/$ID/asignatura/$ID2/enlace?grupo=X # Consulta (GET) el enlace de una clase online de una asignatura de un grado para un grupo de prácticas X.
```

[HU2](https://github.com/antoniocuadros/WhenToClass/issues/9) Como usuario, quiero poder consultar los turnos de presencialidad de un mes determinado y grupo de presencialidad de una asignatura.
```
/grados/$ID/asignatura/$ID2/turno?turno=X&mes=Y # Consulta (GET) el turno de presencialidad de una asignatura de un grado para un turno X y un mes Y.
```

[HU4](https://github.com/antoniocuadros/WhenToClass/issues/28) Como usuario debo poder seleccionar, añadir y eliminar una asignatura
```
/grados/$ID/asignaturas # Obtiene (GET) todas las asignaturas de un grado identificado por $ID
```

### Nuestra API en funcionamiento, ejemplos

Probamos la ruta /status:
![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/paas/images/15.png)

Añadimos un grado:
![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/paas/images/16.png)

Añadimos una asignatura:
![img4](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/paas/images/17.png)

Obtenemos todos los grados añadidos:

![img3](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/paas/images/14.png)

Obtenemos el enlace de la clase online de la asignatura añadida:
![img7](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/paas/images/20.png)

Eliminamos la asignatura:

![img5](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/paas/images/18.png)

Obtenemos el grado que ya no debe conteneder la asignatura:

![img6](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/paas/images/19.png)

