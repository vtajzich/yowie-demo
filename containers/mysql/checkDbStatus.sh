#!/bin/bash

echo "Checking status"

mysql --host=$DB_HOST --user=root --password=$MYSQL_ROOT_PASSWORD -e 'SELECT 1+1;'
EXIT_CODE=$?

while ((EXIT_CODE > 0 ));
do
	echo "Not running: $EXIT_CODE"
	sleep 5s
	
	mysql --host=$DB_HOST --user=root --password=$MYSQL_ROOT_PASSWORD -e 'SELECT 1+1;'
	EXIT_CODE=$?
done

echo "DB is running"

curl -X PUT ${YOWIE_STATUS_UPDATE_URL}READY
