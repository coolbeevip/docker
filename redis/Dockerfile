
FROM redis:7.4.1-alpine

MAINTAINER coolbeevip(coolbeevip@gmail.com)

ENV TZ=Asia/Shanghai

COPY docker-entrypoint.sh /usr/local/bin/

COPY redis.conf /tmp/redis.conf

COPY startup.sh /startup.sh

COPY conf_script.sh /conf_script.sh

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  chmod +x /usr/local/bin/docker-entrypoint.sh && \
  chmod +x /startup.sh && \
  chmod +x /conf_script.sh && \
  mkdir -p /redis && chown redis:redis /redis

WORKDIR /redis

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/startup.sh"]
