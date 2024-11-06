FROM alpine:3.20

MAINTAINER zhanglei@apache.org
ARG MAVEN_VERSION=3.6.3
ARG BASE_URL=https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries
ENV MAVEN_HOME /usr/share/maven

RUN set -x \
    && apk update \
    && apk add --no-cache openjdk21 bash tzdata openssh openssl su-exec unzip libzmq ttf-dejavu curl shadow jattach procps lftp \
    && wget -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget -t 0 -c -T 36000 https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-2.34-r0.apk \
    && apk add --force-overwrite glibc-2.34-r0.apk \
    && rm -rf /var/cache/apk/* \
    && rm /etc/apk/keys/sgerrand.rsa.pub \
    && rm glibc-2.34-r0.apk \
    && mkdir -p /usr/share/maven /usr/share/maven/ref \
    && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
    && rm -f /tmp/apache-maven.tar.gz \
    && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

