# GitHub Action
En este apartado se comenta la creación de una GitHub action que se realizó para la práctica anterior con el objetivo de conseguir un funcionamiento de GitHub Container Registry similar a Docker Hub en el sentido de actualizarse automáticamente con cada push el contenedor para no tener que hacerlo de forma manual y mantener así el contenedor actualizado.

Se ha creado una github action ([se puede consultar aquí](https://github.com/antoniocuadros/WhenToClass/blob/master/.github/workflows/docker.yml)) con el objetivo de que cada vez que se haga push, se hace lo siguiente:
  - Hacemos login en docker (Github Container Registry).
  - Hacemos una build de la imagen.
  - Se ejecutan los tests:
    - Si fallan, no se hace push de la imagen,
    - En caso de que se ejecuten correctamente:
      - Hacemos push de la imagen a Github Container Registry