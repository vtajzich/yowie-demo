#!/bin/bash

curl -X PUT ${YOWIE_STATUS_UPDATE_URL}TESTING

sleep 1s

curl -X GET ${MOVIE_FINDER_URL}/dvd/title/like/something

if [ $? -ne 0 ] 
then
	echo "Error during calling movie finder!"
	exit 1
fi

sleep 1s

curl -X GET ${MOVIE_FINDER_URL}/dvd/title/like/hel

if [ $? -ne 0 ] 
then
	echo "Error during calling movie finder!"
	exit 1
fi


sleep 1s

curl -X PUT ${YOWIE_STATUS_UPDATE_URL}TESTED

exit 0
