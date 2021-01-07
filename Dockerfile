#Partimos de una ligera imagen de alpine 3.12.1
FROM ruby:2.7.2-alpine3.12

LABEL version="1.0.1" maintainer="antculap@gmail.com"

RUN adduser -D usuario

#Ahora tenemos que instalar todo lo necesario para trabajar con Ruby
RUN apk update &&\
    apk add --no-cache ruby=2.7.1-r3 \
    ruby-bundler=2.1.4-r1 \
    ruby-rake=2.7.1-r3 \
    --update npm \
    curl

RUN npm install pm2 -g


#Para evitar problemas al hacer gem install desde usuario
ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH $GEM_HOME/bin:$PATH
RUN mkdir -p "$GEM_HOME" && chmod 777 "$GEM_HOME"

#Necesario para crear datos, no se pueden crear archivos en la carpeta donde se monta
RUN mkdir /logs
RUN mkdir /data
RUN mkdir /data_test
RUN chmod a+w /logs
RUN chmod a+w /data
RUN chmod a+w /data_test

#Traemos los ficheros de dependencias
COPY Gemfile Gemfile.lock /home/usuario/

RUN chmod a+w /home/usuario/Gemfile.lock
RUN chmod a+w /home/usuario

#cambiamos usuario
USER usuario

WORKDIR /home/usuario/

#Instalamos las dependencias
RUN bundle install

#Ya no necesitamos los Gemfiles porque las dependencias se han instalado ya
RUN rm -r /home/usuario/Gemfile*

WORKDIR /test

#Ejecución de los tests
CMD ["rake","test"]