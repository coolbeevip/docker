# Asciidoctor docker container 

including SC TC KR JP font.

```shell
docker run -it --rm \
-v src/docs/asciidoc:/documents/ \
coolbeevip/asciidoctor
```

HTML5 converter

```shell
asciidoctor Main.adoc
```

XHTML converter

```shell
asciidoctor -b xhtml5 Main.adoc
```

DocBook converter

```shell
asciidoctor -b docbook Main.adoc
```

PDF converter

```shell
asciidoctor-pdf \
-a scripts=cjk \
-a pdf-theme=/opt/cjk/themes/default-ext-notoserif-cjk-sc-theme.yml \
-a pdf-fontsdir=/opt/cjk/fonts \
Main.adoc
```

EPUB converter

```shell
asciidoctor-epub3 Main.adoc
```

DocBook to MS Word [more](https://rmoff.net/2020/04/16/converting-from-asciidoc-to-google-docs-and-ms-word/)

```shell
pandoc --from docbook --to docx --output Main.docx Main.xml
```