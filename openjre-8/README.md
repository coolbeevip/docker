# OPENJDK

## BASE

* openjdk:8-jre-alpine

## SYSTEM

* en_US.UTF-8
* Asia/Shanghai

## DEFAULT JVM

* -Xms256m
* -Xmx1g
* -Xss256k
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
* glibc
* procps
* jattach

## Integration Skywalking Agent 8.1.0

environment variable

* SW_AGENT_ENABLED=false

  Use `-javaagent:/skywalking/agent/skywalking-agent.jar` when SW_AGENT_ENABLED = true

* SW_AGENT_COLLECTOR_BACKEND_SERVICES

  Skywalking OAP address. e.g. `127.0.​0.1:11800`

* SW_AGENT_NAME  

  Your application name. e.g. `my-service`


## Tools

Show top N threads CPU usage in a process

```shell
ps -mp <PID> -o THREAD,tid,time | sort -rn | awk '{printf "%s \t %x\n", $2,$8}' | head -10
```    
