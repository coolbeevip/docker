# OPENJDK

## BASE

* openjdk:8-jre-alpine

## SYSTEM

* en_US.UTF-8
* Asia/Shanghai
* ulimit -n 65536
* ulimit -s 819200

## DEFAULT JVM

* -Xms256m
* -Xmx1g
* -Xss1024k
* -XX:MetaspaceSize=128m
* -XX:MaxMetaspaceSize=512m

* -Xnoclassgc  
* -XX:+UseConcMarkSweepGC
* -XX:+UseParNewGC
* -XX:ParallelGCThreads=12
* -XX:MaxTenuringThreshold=15
* -XX:+ExplicitGCInvokesConcurrent
* -XX:+CMSParallelRemarkEnabled
* -XX:SurvivorRatio=8
* -XX:CMSInitiatingOccupancyFraction=65
* -XX:+UseCMSInitiatingOccupancyOnly
* -XX:+CMSClassUnloadingEnabled

* -XX:+PrintGCDetails
* -XX:+UseGCLogFileRotation
* -XX:NumberOfGCLogFiles=10
* -XX:GCLogFileSize=1024k
* -XX:+PrintGCDateStamps
* -XX:+PrintGCTimeStamps
* -Xloggc:logs/gc-$(date +%s).vgc

## TOOLS

* bash
* tzdata
* openssh
* su-exec
* unzip
* libzmq
* ttf-dejavu
* curl
* shadow
* glibc 2.35
* procps
* jattach
* lftp

## Tools

Show top N threads CPU usage in a process

```shell
ps -mp 1 -o THREAD,tid,time | sort -rn | awk '{printf "%s\t%s\t 0x%x\n", $2,$5,$8}' | head -10
```    
