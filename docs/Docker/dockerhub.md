# Contenedor subido a Docker Hub

Se ha creado un repositorio en Docker Hub y se ha configurado para que se construya automáticamente cada vez que se actualiza el repositorio de GitHub.

El repositorio puede ser consultado [aquí](https://hub.docker.com/r/antoniocuadros/whentoclass).

Se muestra el repositorio de Docker Hub:

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/dockerhub/vistapublica.png)

En la configuración de GitHub y para su actualización de forma automática en Docker Hub necesitamos un Webhook:
![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/dockerhub/webhooks.png)

En la configuración de Docker Hub del repositorio debemos tener lo siguiente:
![img3](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/dockerhub/auto1.png)