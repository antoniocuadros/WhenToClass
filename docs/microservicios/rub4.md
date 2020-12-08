# Tests correctos y de acuerdo con las historias de usuario.

### Tests de integración
Para poder llevar a cabo los tests de integración, se ha necesitado hacer uso de una nueva gema: `rack-test`. Una vez importada al archivo donde tendremos los tests de integración podemos empezar a escribirlos. Se encuentran todos los tests en el siguiente [archivo](https://github.com/antoniocuadros/WhenToClass/blob/master/t/TestApi.rb) y pueden ser ejecutado haciendo uso del gestor de tareas con la siguiente orden :`rake test`.

En el fichero de tests `TestApi.rb` podemos ver que los tests se realizan de forma muy sencilla, mostramos a continuación algún ejemplo:

Ejemplo de test de ruta con POST:
```
def test_anadir_grado_ok
    a_anadir = @grado
    post '/grado', a_anadir.to_json    
        res = {"añadido"=>"0e78a27a1e605334c0ba"}
        res = res.to_json
        assert_equal last_response.status, 200
        assert_equal(last_response.content_type, 'application/json')
        assert_equal(last_response.body, res)
end
```
Como vemos, es muy sencillo, indicamos que vamos a hacer test con la función HTTP POST y le pasamos la información a mandar, en este caso, `a_anadir`. Y comprobamos que el resultado sea igual a `{"añadido"=>"0e78a27a1e605334c0ba"}`, que la cabecera sea `Content-Type:'application/json'` y el código de estado sea 200.

Si por ejemplo vemos un test de una ruta con GET es muy similar:

```
def test_consultar_grado_ok
    a_anadir = @grado
    #Añadimos para poder consultar
    post '/grado', a_anadir.to_json    

    #Probamos a consultar
    get '/grado/0e78a27a1e605334c0ba' 
        res = a_anadir
        res = res.to_json
        assert_equal last_response.status, 200
        assert_equal(last_response.content_type, 'application/json')
        assert_equal(last_response.body, res)
    FileUtils.rm_rf("data/0e78a27a1e605334c0ba")
end
```
- Se añade un grado.
- Se prueba a consultarlo
- Se comprueba que se ha obtenido el que se ha añadido y el código de estado y cabeceras sean correctas.

No se muestra un ejemplo de DELETE ya que tambieén es muy parecido, se pueden consultar todos los tests [aquí](https://github.com/antoniocuadros/WhenToClass/blob/master/t/TestApi.rb)


## Historias de Usuario
De acuerdo a los tests realizados, se han avanzado las historias de usuario correspondientes a las funcionalidades implementadas por la API:
- [[HU1] Como usuario, quiero obtener el horario de teoría y prácticas de una asignatura dado un grupo de prácticas y obtenerlo en orden de lunes a viernes](https://github.com/antoniocuadros/WhenToClass/issues/8)
- [[HU2] Como usuario, quiero poder consultar los turnos de presencialidad de un mes determinado y grupo de presencialidad de una asignatura.](https://github.com/antoniocuadros/WhenToClass/issues/9)
- [[HU4] Como usuario debo poder seleccionar, añadir y eliminar una asignatura](https://github.com/antoniocuadros/WhenToClass/issues/28)
- [[HU6] Como usuario quiero poder obtener los enlaces de las clases online de una determinada asignatura](https://github.com/antoniocuadros/WhenToClass/issues/47)
- [[HU10] Como administrador de una universidad tendría que poder añadir, eliminar grados y consultarlos](https://github.com/antoniocuadros/WhenToClass/issues/71)