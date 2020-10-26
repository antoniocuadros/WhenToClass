# Contenedor subido a Docker Hub y configuración de la automatización

## Repositorio creado y enlazado con repositorio GitHub
Se ha creado un repositorio en Docker Hub y se ha configurado para que se construya automáticamente cada vez que se actualiza el repositorio de GitHub.

El repositorio puede ser consultado [aquí](https://hub.docker.com/r/antoniocuadros/whentoclass).

Se muestra el repositorio de Docker Hub:

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/dockerhub/vistapublica.png)

## Configuración de la automatización

### En GitHub:

En la configuración de GitHub y para su actualización de forma automática en Docker Hub necesitamos un Webhook:

![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/dockerhub/webhooks.png)

### En Docker Hub

En la configuración de Docker Hub del repositorio debemos tener lo siguiente:

![img3](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/dockerhub/auto1.png)


## Automatización funcionando

Y de esta forma ya hemos automatizado el proceso de hacer build en DockerHub tras hacer un push en nuestro repositorio de GitHub, podemos ver a la derecha el historial de builds que se han hecho de forma automatizada, de hecho se puede ver a la derecha que justo se está haciendo una build ya que se ha hecho un push al repositorio de GitHub hace unos minutos:
![img3](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/dockerhub/auto2.png)
