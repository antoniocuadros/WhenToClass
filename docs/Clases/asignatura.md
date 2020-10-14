[En este enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/lib/asignatura.rb) se puede consultar la clase asignatura. 
Una asignatura tendrá la siguiente información:
- **nombre:** representado por la variable @nombre.
- horario de teoría: representado por la variable @horario_teoría que es un estruct que contiene día, hora inicio, hora fin, grupo y puede ser consultado [aquí](https://github.com/antoniocuadros/WhenToClass/blob/master/lib/horarioasignatura.rb).
- **horario de prácticas:** representado por la variable @horario_practicas que es un vector de estructuras como las mencionadas anteriormente, donde la posición 0 tiene el horario de prácticas del grupo 1, la posición 1 la del grupo 2, etc.
- **grupo:** representado por la variable @grupo y representa si una asignatura es el grupo A, B, etc.
- **turno de presencialidad:** representado por la variable @turno_presencialidad y es un matriz de tal manera que la fila 0 contiene el conjunto de días que tiene que ir el grupo de presencialidad 1 en sus distintas columnas, análogamente para la siguiente fila pero en ese caso para el grupo de presencialidad 2.

Además contamos con los siguientes métodos:

- **ObtenerHorario:** se le pasa un grupo de prácticas (cadena de texto) y devuelve un vector de  estructuras mencionadas anteriormente y además están ordenadas de lunes a viernes, se devolverá tanto la información temporal de la teoría como la de las prácticas del grupo proporcionado como argumento.
- **obtenerDiasPresenciales:** Método que dado un turno de presencialidad (1, 2, ...) y un mes (sep, oct, nov, dec, jan, ...) devuelve que días tenemos que ir presencialmente en ese mes y para ese turno.
- **tengoQueIrEstaSemana:** Método que proporcionando un turno de presencialidad (1, 2, ...) devuelve verdadero si tenemos que ir esta semana o falso en caso contrario. 

