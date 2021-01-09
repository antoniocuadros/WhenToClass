## Descripción de la configuración para despliegue automático, desde el repositorio o desde el sistema de integración continua.
Para desplegar la aplicación puede consultarse la [siguiente documentación](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/paas/justificacionpaas.md) en el apartado 'Como desplegar esta aplicación'. Adicionalmente se puede configurar el despliegue automático de forma muy sencilla en Heroku con cada push que se haga en el repositorio de GitHub de la siguiente forma en el apartado 'Deploy de Heroku':
- En el subapartado 'Deployment method' se debe vincular una cuenta de github que contenga nuestra aplicación tal y como yo lo he configurado para mi aplicación en Heroku:
![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/paas/images/10.png)

- En el subapartado siguiente llamado 'App connected to GitHub' debemos vincular el repositorio al cual queremos que con cada push haga un deploy de forma automática:

![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/paas/images/11.png)


- En el siguiente subapartado 'Automatic deploys' debemos decir que sí y en caso de que queramos esperar a que pasen todos los CI antes de desplegar debemos habilitar la opción 'Wait for CI to pass before deploy'. Quedaría de la siguiente forma:

![img3](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/paas/images/12.png)

Y ya vemos que en nuestro repositorio al hacer el primer push si pasan todos los CI nos aparece lo siguiente:

![img3](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/paas/images/13.png)