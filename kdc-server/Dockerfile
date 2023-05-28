FROM maven:3.8.6-eclipse-temurin-8 as builder

ARG KERBY_VERSION=2.0.3
ARG KERBY_HOME=/usr/local/kerby

WORKDIR /tmp
ADD https://repo1.maven.org/maven2/org/apache/kerby/kerby-all/${KERBY_VERSION}/kerby-all-${KERBY_VERSION}-source-release.zip /tmp
##ADD kerby-all-${KERBY_VERSION}-source-release.zip /tmp
RUN apt-get update -y && apt-get install -y unzip \
  && unzip -q *.zip \
  && cd /tmp/kerby-all-${KERBY_VERSION}/kerby-dist/kdc-dist \
  && mvn clean install -Pdist \
  && mkdir ${KERBY_HOME} && cd ${KERBY_HOME} \
  && cp -r /tmp/kerby-all-${KERBY_VERSION}/kerby-dist/kdc-dist/* . \
  && rm -rf /tmp/kerby-*

FROM ubuntu:22.04
MAINTAINER zhanglei@apache.org

COPY --from=builder /usr/local/kerby /usr/local/kerby

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y -qq install krb5-user \
  && chmod +x /usr/local/kerby/bin/*.sh \
  && mkdir -p /usr/local/kerby/runtime \
  && apt-get clean

WORKDIR /usr/local/kerby
EXPOSE 88

ENTRYPOINT ["bin/start-kdc.sh"]
CMD ["/kerby-data/conf", "runtime"]
