## Base de Datos

Para llevar a cabo el almacenamiento y recuperación de la información de la que hace uso nuestra aplicación se ha seguido utilizando la jerarquía de clases comentada en el hito anterior, donde recordemos teníamos una clase Dator que definía todas las operaciones que debían ser implementadas para trabajar con datos persistentes, era una clase abstracta con métodos abstractos de tal forma que diversas clases podían implementar sus métodos de acceso y recuperación de información de diferentes formas de forma totalmente transparente para la api. Gracias a esta jerarquía conseguíamos los dos principios fundamentales a seguir a la hora de implementar persistencia:
- Inyección de dependencias: se inyecta una dependencia, en nuestro caso se verá que para crear un objeto de la clase controladora, es necesario "inyectarle" el objeto que accede a los datos.
- Única fuente de verdad: Dicho objeto que es inyectado será el único que acceda a los datos.

Gracias a esto vimos que creamos la clase FSDator que nos permitía trabajar con informción almacenada en un sistema de ficheros, pero para la realización de esta práctica se va a probar a trabajar con **MongoDB Atlas** ya que me ha llamado la atención, he visto que es muy utilizada, se aloja en la nube, posee una prueba gratuita y creo que podría resultarme útil aprender a manejarme con este tipo de bases de datos para el futuro. Debido a esto se ha tenido que crear un nuevo Dator llamado MONGODator que se encargará de acceder a nustra base de datos en MongoDB Atlas e implementar los métodos definidos en Dator pero ahora con esta base de datos en vez de con ficheros como hacíamos en FSDator.

Para hacer uso de este servicio en la nube he necesitado acceder a su [página oficial](https://www.mongodb.com/cloud/atlas), registrarme, indicar el lenguaje que se va a utilizar (para posteriormente mostrarte tutoriales de dicho lenguaje), elegir el plan, en micaso el gratuito que incluye:

```
Clúster de reparación automática de alta disponibilidad
Encriptado de fin a fin
Control de acceso basado en roles
```

Posteriormente tenemos que indicar un proveedor de nube entre los que deja elegir aws, google cloud y azure, en mi caso he elegido la opción por defecto, aws, además debemos indicar la región en mi caso la que menor latencia tenía era Frankfurt y ya podemos ver que el almacenamiento gratuito es de 512 MB.

Si lo hemos configurado correctamente nos llevará a nuestro panel de administración que tiene el siguiente aspecto:

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/paas/images/1.png)

Ahora en el apartado connect obtenemos el string para poder conectarnos y creamos en el CLI de Heroku una variable de configuración por ejemplo llamada 'MONGODB_URI' de la siguiente forma:

```
heroku config:set MONGODB_URI="..."
```

Donde entre las comillas pondremos el string generado previamente. Si el comando ha tenido éxito en la web podremos ver la siguiente línea `antculap@gmail.com: Set MONGODB_URI config var`.


Una vez hecho esto y en la api habiendo cambiado el dator por el nuevo MONGODator pasándole al constructor ENV['MONGO_URI'] ya tenemos funcionando la base de datos.

Por ejemplo si hacemos un post a la aplicación ya desplegada en Heroku para añadir un grado con sus asignaturas vemos que efectivamente se nos almacena correctamente:

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/paas/images/4.png)