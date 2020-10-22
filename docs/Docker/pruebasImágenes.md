## Pruebas rendimiento y almacenamiento imágenes base para Ruby
A continuación se muestra una comparativa de almacenamiento y velocidad de ejecución de los tests con diversas imágenes base, dichas imágenes han sido explicadas en en [siguiente enlace](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/Imagenes_base.md):
#### ruby:2.7.2
Peso:

![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/base/peso.png)

Tiempo en ejecutar los tests:

![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/base/tiempo.png)

#### ruby:2.7.2-slim
Peso:

![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/slim/peso.png)

Tiempo en ejecutar los tests:

![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/slim/tiempo.png)

#### ruby:2.7.2-alpine
Peso:

![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/alpine/peso.png)

Tiempo en ejecutar los tests:

![img](https://github.com/antoniocuadros/WhenToClass/blob/master/docs/Docker/images/alpine/tiempo.png)

### Comparación
| Imagen | Peso | Tiempo de ejecución tests|
|---|---|---|
ruby:2.7.2  | 859MB | 6,137s 
ruby:2.7.2-slim | 166MB | 3s 
ruby:2.7.2-alpine | 68MB | 1,154s 