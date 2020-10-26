#Partimos de una ligera imagen de alpine 3.12.1
FROM alpine:3.12.1

LABEL version="1.0.1" maintainer="antculap@gmail.com"

RUN adduser -D usuario

#Ahora tenemos que instalar todo lo necesario para trabajar con Ruby
RUN apk update &&\
    apk add --no-cache ruby=2.7.1-r3 \
    ruby-bundler=2.1.4-r1 \
    ruby-rake=2.7.1-r3

#Deshabilitamos un warnig que produce Bundler
ENV BUNDLE_SILENCE_ROOT_WARNING=1

#Traemos los ficheros de dependencias
COPY Gemfile Gemfile.lock ./src/app/

WORKDIR /src/app/

#Instalamos las dependencias
RUN bundle install

#Ya no necesitamos los Gemfiles porque las dependencias se han instalado ya
RUN rm -r /src/app/Gemfile*

USER usuario

VOLUME /test
WORKDIR /test

#Ejecución de los tests
CMD ["rake","test"]