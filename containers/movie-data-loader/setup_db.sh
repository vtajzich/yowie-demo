#!/bin/bash

curl -X PUT ${YOWIE_STATUS_UPDATE_URL}CREATING_DB

echo "pause is: ${PAUSE:=15}"

sleep ${PAUSE:=15}s

echo "Going to setup db for host=$DB_HOST user=$DB_USER password=$DB_PASS "
mysql --local-infile --host=$DB_HOST --user=$DB_USER --password=$DB_PASS < /home/db/create_db.sql

EXIT_CODE=$?

if ((EXIT_CODE > 0 ))
	then
		echo "Cannot load data into db."
		exit $EXIT_CODE
	else 	
		curl -X PUT ${YOWIE_STATUS_UPDATE_URL}DB_CREATED
fi
