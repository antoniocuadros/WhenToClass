FROM alpine:3.12.1

LABEL version="1.0.1" maintainer="antculap@gmail.com"


RUN apk update &&\
    apk add --no-cache ruby=2.7.1-r3 \
    ruby-bundler=2.1.4-r1 \
    ruby-rake=2.7.1-r3

ENV BUNDLE_SILENCE_ROOT_WARNING=1

COPY Gemfile Gemfile.lock ./src/app/

WORKDIR /src/app/

RUN bundle install

RUN rm -r /src/app/Gemfile*

VOLUME /test
WORKDIR /test

CMD ["rake","test"]