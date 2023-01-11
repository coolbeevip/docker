FROM asciidoctor/docker-asciidoctor:1.37

MAINTAINER coolbeevip(coolbeevip@gmail.com)

RUN mkdir -p /opt/cjk
COPY cjk /opt/cjk

WORKDIR /documents
VOLUME /documents

CMD ["/bin/bash"]
