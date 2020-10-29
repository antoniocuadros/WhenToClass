#Partimos de una ligera imagen de alpine 3.12.1
FROM alpine:3.12.1

LABEL version="1.0.1" maintainer="antculap@gmail.com"

RUN adduser -D usuario

#Ahora tenemos que instalar todo lo necesario para trabajar con Ruby
RUN apk update &&\
    apk add --no-cache ruby=2.7.1-r3 \
    ruby-bundler=2.1.4-r1 \
    ruby-rake=2.7.1-r3

ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH $GEM_HOME/bin:$PATH

# adjust permissions of a few directories for running "gem install" as an arbitrary user
RUN mkdir -p "$GEM_HOME" && chmod 777 "$GEM_HOME"


USER usuario
#Traemos los ficheros de dependencias
COPY Gemfile Gemfile.lock /home/usuario/

WORKDIR /home/usuario/

#Instalamos las dependencias
RUN bundle install

#Ya no necesitamos los Gemfiles porque las dependencias se han instalado ya
RUN rm -r /home/usuario/Gemfile*

WORKDIR /test

#Ejecución de los tests
CMD ["rake","test"]