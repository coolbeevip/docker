FROM ubuntu:jammy

MAINTAINER zhanglei@apache.org

WORKDIR /jar-guard

COPY release/jar-guard-tool-server ./
COPY release/Rocket.toml ./
COPY release/static ./static

RUN chmod +x ./jar-guard-tool-server

EXPOSE 8000

CMD ["./jar-guard-tool-server"]