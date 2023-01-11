FROM asciidoctor/docker-asciidoctor:1.37

MAINTAINER coolbeevip(coolbeevip@gmail.com)

WORKDIR /documents
VOLUME /documents

RUN gem install asciidoctor-pdf-cjk-kai_gen_gothic && asciidoctor-pdf-cjk-kai_gen_gothic-install

CMD ["/bin/bash"]
