FROM eclipse-temurin:17.0.11_9-jre

MAINTAINER zhanglei@apache.org

ENV WORKUSER=ncuser
ENV WORKGROUP=ncgroup
ENV WORKUID=12000
ENV WORKGID=12000

ENV LANG='en_US.UTF-8' \
    LC_ALL='en_US.UTF-8' \
    JAVA_TOOL_OPTIONS="-Xms512m -Xmx1g -Xss1024k -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m -Xnoclassgc -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:ParallelGCThreads=12 -XX:MaxTenuringThreshold=15 -XX:+ExplicitGCInvokesConcurrent -XX:+CMSParallelRemarkEnabled -XX:SurvivorRatio=8 -XX:CMSInitiatingOccupancyFraction=65 -XX:+UseCMSInitiatingOccupancyOnly -XX:+CMSClassUnloadingEnabled -XX:+PrintGCDetails -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=1024k -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -Xloggc:/var/log/nc/gc.vgc"

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN set -x && \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk update && \
    apk add --no-cache bash tzdata openssh su-exec unzip libzmq ttf-dejavu curl shadow jattach procps lftp && \
	  cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    mkdir -p /var/log/nc

RUN chmod +x /usr/local/bin/docker-entrypoint.sh \
  && ln -s /usr/local/bin/docker-entrypoint.sh

RUN addgroup -g ${WORKGID} -S ${WORKGROUP} && adduser -u ${WORKUID} -S ${WORKUSER} -G ${WORKGROUP} && \
  chown -R ${WORKUSER}:${WORKGROUP} /var/log/nc

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
