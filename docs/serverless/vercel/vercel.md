# Despliegue de una función serverless con Vercel e integración con el proyecto

## ¿Para qué se ha utilizado Vercel?
Como primer sistema serverless se ha utilizado Vercel. En dicho sistema se ha programado una función serverless (que se puede consultar [aquí](https://when-to-class.vercel.app/api/enlace?asignatura=IV&m=p&d=m)) con el objetivo de prototipar una función que podría añadirse a mi proyecto, obtener los enlaces de las clases online de una determinada asignatura. Como se acaba de mencionar se ha hecho uso de una función serverless para prototipar de forma rápida y sencilla una función que podríamos incorporar a nuestro proyecto más adelante ya que desde mi punto de vista los sistemas serverless pueden resultar de gran utilidad para programar la lógica de una función, testearla y posteriormente incorporar dicha funcionalidad a nuestro proyecto.

## Integración dentro del proyecto
Como se ha mencionado anteriormente, se ha creado una función serverless que sirve para obtener los enlaces de las clases online de una determinada asignatura dándole como parámetros la asignatura, la modalidad (prácticas o teoría), y el día de la semana. En caso de que se pasen mal los parámetros o no se pase ninguno, el comportamiento por defecto de la aplicación es buscar los enlaces de las clases que se tienen el día en el que se realiza la petición. 

Como podemos ver, se sigue avanzando código relacionado con el proyecto general y debido a ello se han abierto un issue y una historia de usuario que se pueden encontrar en los siguientes enlaces: 

- [crear función serverless que me permita preguntar por los enlaces de una determinada asignatura](https://github.com/antoniocuadros/WhenToClass/issues/77)
- [[HU6] Como usuario quiero poder obtener los enlaces de las clases online de una determinada asignatura](https://github.com/antoniocuadros/WhenToClass/issues/47)

Además cada vez que se realiza un push se desplegará el proyecto actualizado en vercel, para ver esto se recomienda ir a la [documentación de la conexión entre Vercel y GitHub](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/serverless/conexion/despliegue.md).

## ¿Qué hace nuestra función serverless?
Nos centramos ahora en la implementación realizada en Vercel. Para Vercel poder funcionar correctamente se nos pide que creemos una carpeta denominada api donde se encontrará todo lo relacionado con Vercel, dicha carpeta se puede consultar [aquí](https://github.com/antoniocuadros/WhenToClass/tree/master/api).


Dentro de esa carpeta encontramos un fichero [data.json](https://github.com/antoniocuadros/WhenToClass/blob/master/api/data.json) donde encontramos datos de prueba que serán utilizados por la función serverless para realizar ciertas operaciones con ellos en función de lo que se solicite. Por ejemplo en el siguiente [enlace](https://when-to-class.vercel.app/api/enlace?asignatura=IV&m=p&d=m) estamos solicitando el enlace a la clase online de las prácticas de los martes de la asignatura IV. Además si modificamos los datos, como necesitamos hacer un push para subir los cambios, y tenemos Vercel vinculado con el repositorio, se actualizarán los datos que utiliza nuestra función.

Por defecto como se ha comentado anteriormente, si no se le pasan parámetros, el comportamiento por defecto es, teniendo en cuenta el día en el que el usuario realiza la petición, se buscan todas las cases de ese día, y se devuelven los enlaces porque lo más probable es que si está accediendo al sitio, sea para obtener el enlace de alguna clase que va a tener en ese mismo día.

Si entramos más en detalles de nuestra función serverless, que se encuentra en el fichero [enlace.rb](https://github.com/antoniocuadros/WhenToClass/blob/master/api/enlace.rb), en dicho fichero podemos encontrar lo siguiente:


Todo el código se encuentra encapsulado en lo que se conoce como un Proc. Un proc no es más que la encapsulación de un bloque de código que se puede almacenar en una variable, en este caso, Handler. Esta es la estructura que debe seguir nuestra función serverless de acuerdo a lo que encontramos en la [documentación oficial de Vercel para trabajar con Ruby](https://vercel.com/docs/serverless-functions/supported-languages#ruby).

De esta forma todo el código se encuentra encapsulado en: 

```
Handler = Proc.new do |req, res|
  ...
end
```

Como podemos observar tenemos tanto un objeto req, que hace referencia a una petición, como un objeto res que hace referencia a una respuesta.

De esta forma vamos a desgranar el código que nos encontramos dentro de dicho bloque Proc:

- En primer lugar obtenemos los parámetros que se han podido pasar de una forma muy sencilla: 

```
  asignatura = req.query['asignatura']
  modalidad = req.query['m']
  dia = req.query['d']
```

- A continuación se carga en una variable todos los datos JSON leídos parseados:

```
  ubicacion = File.join(File.dirname(__FILE__),'data.json')
  fichero = File.read(ubicacion)
  datos = JSON.parse(fichero)
```

- En siguiente lugar se encuentra la lógica de la aplicación, que básicamente hace lo que hemos comentado varias veces, buscar el enlace de la clase online solicitado a traves de unos determinados parámetros que extraemos de la petición y que son procesados para obtener una respuesta y almacenar en una variable `a_devolver` el JSON que devolveremos, puede consultarse dicha lógica en el propio fichero [enlace.rb](https://github.com/antoniocuadros/WhenToClass/blob/master/api/enlace.rb).


- Por último, lo que se hace es devolver un código 200 ya que pase o no pase parámetros un determinado usuario vamos a devolver una respuesta, ya sea el enlace solicitado o el de las asignaturas del día de hoy ,indicamos que el content type es `application/json` ya que lo que queremos devolver es un JSON y añadimos el JSON:

```
  res.status = 200
  res['Content-Type'] = 'application/json; charset=utf-8'
  res.body = a_devolver.to_json
```


### Tests del código
Siguiendo las buenas prácticas que llevamos realizando en la asignatura, se han realizado tests que se pueden encontrar en el siguiente [fichero](https://github.com/antoniocuadros/WhenToClass/blob/master/api/t/testEnlace.rb) y además en el fichero Rakefile se ha añadido una nueva tarea para ejecutar dichos tests, se pueden probar ejecutando `rake testvercel`. Si lo ejecutamos podemos ver que pasan los tests:

```
➜  WhenToClass git:(master) ✗ rake testvercel
Run options: --seed 17956

# Running:

....

Finished in 5.857324s, 0.6829 runs/s, 1.3658 assertions/s.

4 runs, 8 assertions, 0 failures, 0 errors, 0 skips
```