FROM alpine:3.20

MAINTAINER zhanglei@apache.org

ENV WORKUSER=ncuser
ENV WORKGROUP=ncgroup
ENV WORKUID=12000
ENV WORKGID=12000

ENV LANG='en_US.UTF-8' \
    LC_ALL='en_US.UTF-8' \
    JAVA_TOOL_OPTIONS="-Xms512m -Xmx1g -Xss1024k -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m -Xnoclassgc -XX:+UseG1GC -XX:ParallelGCThreads=12 -XX:MaxTenuringThreshold=15 -XX:+ExplicitGCInvokesConcurrent -XX:SurvivorRatio=8 -XX:InitiatingHeapOccupancyPercent=65 -Xlog:gc*:file=/var/log/nc/gc.vgc:time,level,tags:filecount=10,filesize=1M"

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN set -x && \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk update && \
    apk add --no-cache openjdk21-jre bash tzdata openssh openssl su-exec unzip libzmq ttf-dejavu curl shadow jattach procps lftp && \
	  cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    wget -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget -t 0 -c -T 36000 https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-2.34-r0.apk && \
    apk add --force-overwrite glibc-2.34-r0.apk && \
    rm -rf /var/cache/apk/* && \
    rm /etc/apk/keys/sgerrand.rsa.pub && \
    rm glibc-2.34-r0.apk && \
    mkdir -p /var/log/nc

RUN chmod +x /usr/local/bin/docker-entrypoint.sh \
  && ln -s /usr/local/bin/docker-entrypoint.sh

RUN addgroup -g ${WORKGID} -S ${WORKGROUP} && adduser -u ${WORKUID} -S ${WORKUSER} -G ${WORKGROUP} && \
  chown -R ${WORKUSER}:${WORKGROUP} /var/log/nc

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
