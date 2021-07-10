FROM alpine:3.10

MAINTAINER coolbeevip <coolbeevip@gmail.com>

# 设置 字符集

ENV LANG='en_US.UTF-8' \
    LC_ALL='en_US.UTF-8'

# 安装 bash tzdata openssh su
# 设置中国时区

RUN set -x && \
    apk update && \
    apk add --no-cache bash tzdata openssh su-exec unzip libc6-compat libzmq ttf-dejavu curl shadow sshpass ansible && \
    cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
