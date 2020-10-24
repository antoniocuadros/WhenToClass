# Como ejecutar los tests en el contenedor
En primer lugar deberemos bajarnos el contenedor, tenemos dos posibilidades:
- Docker Hub: 
  > docker pull antoniocuadros/whentoclass
- GitHub Container Registry:
  > docker pull ghcr.io/antoniocuadros/whentoclasstests:v2

Una vez tenemos la imagen tenemos que descargarnos el [repositorio de GitHub](https://github.com/antoniocuadros/WhenToClass):
> git clone git@github.com:antoniocuadros/WhenToClass.git

Y ya podemos ejecutar los tests (ejecutar lo siguiente desde dentro de la carpeta del repositorio descargado):
>docker run -t -v \`pwd`:/test IMAGE_ID 
