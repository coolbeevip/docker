FROM asciidoctor/docker-asciidoctor:1.37

MAINTAINER coolbeevip(coolbeevip@gmail.com)

RUN gem install asciidoctor-pdf-cjk-kai_gen_gothic
RUN asciidoctor-pdf-cjk-kai_gen_gothic-install

WORKDIR /documents
VOLUME /documents

CMD ["/bin/bash"]
