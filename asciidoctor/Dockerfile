FROM asciidoctor/docker-asciidoctor:1.37

MAINTAINER coolbeevip(coolbeevip@gmail.com)

RUN mkdir -p /opt/fonts
COPY fonts/*.ttf /opt/fonts

WORKDIR /documents
VOLUME /documents

CMD ["/bin/bash"]
