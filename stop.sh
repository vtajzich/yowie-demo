#!/bin/bash

docker kill $(docker ps -a -q)

docker rm mesos_master
docker rm mesos_slave
docker rm yowie