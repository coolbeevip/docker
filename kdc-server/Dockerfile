FROM maven:3.8.6-eclipse-temurin-8

MAINTAINER zhanglei@apache.org

ARG KERBY_VERSION=2.0.3
ARG KERBY_HOME=/usr/local/kerby-${KERBY_VERSION}

WORKDIR /tmp
ADD https://repo1.maven.org/maven2/org/apache/kerby/kerby-all/${KERBY_VERSION}/kerby-all-${KERBY_VERSION}-source-release.zip /tmp
RUN unzip -q *.zip \
  && cd /tmp/kerby-all-${KERBY_VERSION}/kerby-dist/kdc-dist \
  && mvn clean install -Pdist \
  && mkdir ${KERBY_HOME} && cd ${KERBY_HOME} \
  && cp -r /tmp/kerby-all-${KERBY_VERSION}/kerby-dist/kdc-dist/* . \
  && rm -rf /tmp/kerby-* \
  && mkdir -p runtime \
  && chmod +x bin/start-kdc.sh

WORKDIR ${KERBY_HOME}
EXPOSE 88

ENTRYPOINT ["bin/start-kdc.sh"]
CMD ["/kerby-data/conf", "runtime"]