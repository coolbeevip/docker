FROM maven:3.8.6-eclipse-temurin-8 as builder

ARG KERBY_VERSION=2.0.3
ARG KERBY_HOME=/usr/local/kerby

WORKDIR /tmp
ADD https://repo1.maven.org/maven2/org/apache/kerby/kerby-all/${KERBY_VERSION}/kerby-all-${KERBY_VERSION}-source-release.zip /tmp
RUN apt-get update -y && apt-get install -y unzip \
  && unzip -q *.zip \
  && cd /tmp/kerby-all-${KERBY_VERSION}/kerby-dist/kdc-dist \
  && mvn clean install -Pdist \
  && mkdir ${KERBY_HOME} && cd ${KERBY_HOME} \
  && cp -r /tmp/kerby-all-${KERBY_VERSION}/kerby-dist/kdc-dist/* . \
  && rm -rf /tmp/kerby-*

FROM eclipse-temurin:8-jre-jammy
MAINTAINER zhanglei@apache.org

COPY --from=builder /usr/local/kerby /usr/local/kerby
COPY /kerby-data /tmp/kerby-data
COPY docker-entrypoint.sh /
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y \
  && apt-get -y install krb5-user \
  && chmod +x /usr/local/kerby/bin/*.sh \
  && mkdir -p /usr/local/kerby/runtime \
  && apt-get clean \
  && chmod +x /docker-entrypoint.sh

WORKDIR /usr/local/kerby
EXPOSE 88

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["bin/start-kdc.sh", "/kdc/kerby-data/conf", "runtime"]
