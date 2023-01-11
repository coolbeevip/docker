Asciidoctor docker container including SC TC KR JP font.

```shell
docker run -it --rm \
-v src/docs/asciidoc:/documents/ \
coolbeevip/asciidoctor
```

PDF converter

```shell
asciidoctor-pdf \
-a scripts=cjk \
-a pdf-theme=/opt/cjk/themes/default-ext-notoserif-cjk-sc-theme.yml \
-a pdf-fontsdir=/opt/cjk/fonts \
main.adoc
```