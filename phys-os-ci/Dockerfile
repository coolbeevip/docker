FROM python:3.11-slim

LABEL maintainer="zhanglei@apache.org"

ARG NODE_MAJOR=22

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        git \
        gnupg \
        openssh-client \
        rsync \
        sshpass \
    && mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key \
        | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_MAJOR}.x nodistro main" \
        > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends nodejs \
    && python -m pip install --no-cache-dir --upgrade \
        pip \
        uv \
        mkdocs \
        mkdocs-material \
    && rm -rf /var/lib/apt/lists/* \
    && node_version="$(node -p 'process.versions.node')" \
    && npm_version="$(npm --version)" \
    && python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:3])))')" \
    && dpkg --compare-versions "${node_version}" ge "20.20.0" \
    && dpkg --compare-versions "${npm_version}" ge "10" \
    && dpkg --compare-versions "${python_version}" ge "3.11" \
    && git --version \
    && node --version \
    && npm --version \
    && python --version \
    && uv --version
