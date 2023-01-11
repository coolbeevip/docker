FROM asciidoctor/docker-asciidoctor:1.37

MAINTAINER coolbeevip(coolbeevip@gmail.com)

COPY cjk /opt/cjk

RUN apk add --no-cache pandoc

WORKDIR /documents
VOLUME /documents

CMD ["/bin/bash"]
