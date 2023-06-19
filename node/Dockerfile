FROM node:12.18.3-alpine3.11

MAINTAINER zhanglei@apache.org

RUN apk update && apk upgrade && \
    apk add --no-cache --virtual .gyp bash git openssh python make g++