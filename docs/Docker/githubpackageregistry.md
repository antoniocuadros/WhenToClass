# Subir contenedor a Github Container Registry
Inicialmente se subió el contenedor a Github Package Registry ya que nada más hacer click en el apartado paquetes aparecían las instrucciones para subirlo ahí, ¿el problema?, tal y como podemos ver cuando lo subimos dice que el servicio está obsoleto.


No obstante podemos ver el contenedor subido a Github Package Registry en el [siguiente enlace](https://github.com/antoniocuadros/WhenToClass/packages/471569).

Y los pasos seguidos para subir paquetes a este registro se encuentran [aquí](https://docs.github.com/es/free-pro-team@latest/packages/using-github-packages-with-your-projects-ecosystem/configuring-docker-for-use-with-github-packages) en la documentación oficial.

Investigando, me he dado cuenta que el que está activo actualmente es Github Container Registry y subí ahí mi contenedor que se puede consultar en el [siguiente enlace](https://github.com/users/antoniocuadros/packages/container/package/whentoclasstests).

A continuación se adjuntan imágenes del contenedor subido correctamente:

![img1](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/githubrepositoryregistry/vista2.png)

![img2](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/githubrepositoryregistry/contenedor2.png)

Se han seguido los pasos encontrados en la [documentación oficial](https://docs.github.com/es/free-pro-team@latest/packages/getting-started-with-github-container-registry/migrating-to-github-container-registry-for-docker-images).