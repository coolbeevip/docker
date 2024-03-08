FROM python:3.11-slim

RUN apt update
RUN apt install -y apt-transport-https ca-certificates wget dirmngr gnupg software-properties-common
RUN add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
RUN apt update
RUN apt install adoptopenjdk-8-hotspot