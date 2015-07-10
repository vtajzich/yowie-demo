#!/bin/bash

echo "Starting DB"

/checkDbStatus.sh &

echo "pause is: ${PAUSE:=15}"

sleep ${PAUSE:=15}s

/entrypoint.sh 'mysqld'
