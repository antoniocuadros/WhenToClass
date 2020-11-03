# GitHub Action
En este apartado se comenta la creación de una GitHub action que se realizó para la práctica anterior con el objetivo de conseguir un funcionamiento de GitHub Container Registry similar a Docker Hub en el sentido de actualizarse automáticamente con cada push el contenedor para no tener que hacerlo de forma manual y mantener así el contenedor actualizado. De esta forma se construirá la imagen y se ejecutarán los tests, si todo ha ido bien hasta este punto, se hará un push  a GitHub Container Registry.

La GitHub action ([se puede consultar aquí](https://github.com/antoniocuadros/WhenToClass/blob/master/.github/workflows/docker.yml)) con el objetivo de que cada vez que se haga push. No obstante se muestra a continuación:

```
name: Docker Build Push

on: [push]

jobs:
    build:
        runs-on: ubuntu-latest
        steps:
        - uses: actions/checkout@v2
        - name: docker login
          env:
            DOCKER_USER: ${{ secrets.DOCKER_USER }}
            DOCKER_PASSWORD: ${{ secrets.DOCKER_PASSWORD }}
          run: docker login ghcr.io -u $DOCKER_USER -p $DOCKER_PASSWORD 
        - name: docker build
          run: docker build -t ghcr.io/antoniocuadros/whentoclasstests:v2 .
        - name: exec test
          run: docker run -t -v `pwd`:/test ghcr.io/antoniocuadros/whentoclasstests:v2
        - name: docker push
          run: docker push ghcr.io/antoniocuadros/whentoclasstests:v2
```

Hace lo siguiente:
  - Hacemos login en docker (Github Container Registry).
  - Hacemos una build de la imagen.
  - Se ejecutan los tests:
    - Si fallan, no se hace push de la imagen,
    - En caso de que se ejecuten correctamente:
      - Hacemos push de la imagen a Github Container Registry