FROM coolbeevip/openjre:8-jre-alpine

MAINTAINER zhanglei@apache.org

ARG VERSION=3.9
ARG DOWNLOAD_URL=https://www.jacorb.org/releases/${VERSION}/jacorb-${VERSION}-binary.zip

ENV JACORB_HOME=/jacorb-${VERSION}
ENV PATH=$PATH:$JACORB_HOME/bin

ADD start.sh /start.sh
RUN chmod 700 /start.sh

RUN wget -t 0 -c -T 3600 ${DOWNLOAD_URL} \
  && unzip jacorb-${VERSION}-binary.zip \
  && rm -rf jacorb-${VERSION}-binary.zip

EXPOSE 12000

CMD ["/start.sh"]