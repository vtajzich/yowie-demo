#!/bin/bash

echo "Downloading images"

docker pull vtajzich/yowie-demo:mysql
docker pull vtajzich/yowie-demo:movie-data-loader
docker pull vtajzich/yowie-demo:movie-finder
docker pull vtajzich/yowie-demo:dependency-tester

echo "Starting zookeeper"

docker run -d \
-p 2181:2181 \
-p 2888:2888 \
-p 3888:3888 \
garland/zookeeper

DOCKER_IP=10.211.55.14

echo "Starting mesos master"

docker run --net="host" \
--name mesos_master \
-p 5050:5050 \
-e "MESOS_HOSTNAME="${DOCKER_IP}"" \
-e "MESOS_IP="${DOCKER_IP}"" \
-e "MESOS_ZK=zk://"${DOCKER_IP}":2181/mesos" \
-e "MESOS_PORT=5050" \
-e "MESOS_LOG_DIR=/var/log/mesos" \
-e "MESOS_QUORUM=1" \
-e "MESOS_REGISTRY=in_memory" \
-e "MESOS_WORK_DIR=/var/lib/mesos" \
-e "DOCKER_HOST=tcp://"${DOCKER_IP}":2375" \
-e "DOCKER_TLS_VERIFY=" \
-d \
vtajzich/mesosphere-docker-mesos-master:latest

echo "Starting mesos slave"

docker run --net="host" -d \
--name mesos_slave \
--entrypoint="mesos-slave" \
-e "MESOS_HOSTNAME="${DOCKER_IP}"" \
-e "MESOS_MASTER=zk://"${DOCKER_IP}":2181/mesos" \
-e "MESOS_LOG_DIR=/var/log/mesos" \
-e "MESOS_LOGGING_LEVEL=INFO" \
-e "MESOS_CONTAINERIZERS=docker,mesos" \
-e "MESOS_RESOURCES=cpus:2;mem:999;disk:50000;PORTS:[1520,32000]" \
-e "MESOS_ATTRIBUTES=type:test" \
-e "DOCKER_HOST=tcp://"${DOCKER_IP}":2375" \
-e "DOCKER_TLS_VERIFY=" \
-p 5051:5051 \
-v /sys:/sys \
vtajzich/mesosphere-docker-mesos-master:latest


echo "Starting yowie"

docker run -d --name yowie --net=host -p 8080:8080 -e "LIBPROCESS_IP="${DOCKER_IP}"" -e "mesos.url="${DOCKER_IP}"" -e "yowie.framework.externalUrl=http://"${DOCKER_IP}":8080" vendavo/yowie:0.1.3
