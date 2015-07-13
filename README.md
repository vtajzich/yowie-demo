# yowie-demo
Demo for Yowie framework

# Preface

It's a demo project for yowie framework. The "presentation" is yowie.todo . In order to open it correctly you should use sublime w/ tasks plugin.

# What is in place

* containers - contains all needed containers used in this demo
    - dependency tester - it's just a shell script which notify yowie with some reached state - every 10s goes to next state: SERVER_STARTED, UP, STATE_1, STATE_2, STATE_3
    - mysql - modified original container contains script which checks every 5s if db is up&running. If so then yowie is notified w/ READY status
    - movie-data-loader - creates db, user, grants all permissions, creates table and load dvd.csv to db
    - movie-finder - spring boot based app which do search against mysql
    - movie-tester - contains shell script which does rest call against movie-finder
* rest - requests for yowie
    - dependency-tester - run test group w/ dependencies and terminate task. If you want to see how yowie works, this is what you looking for.
    - get-movies - calls movie-finder
    - mysql - runs mysql db - empty
    - mysql-setup - setup db ...
    - movie-finder - runs app
    - start_all_parallel - starts all containers in "parallel" to show what happens 
    - start_all_with_dependencies - dependencies between containers are set correctly to start db, setup, run app and test app
* start.sh - pulls all needed images, starts zookeeper, mesos master, mesos slave and yowie
* stop.sh - stops all running containers and remove aliases for yowie and mesos slave

# How to use it

In 

```
start.sh
```

there is variable:

```
DOCKER_IP=10.211.55.14
```

Which points to my docker machine. This IP is used in rest calls as well.

__Do not forget to replace it with IP of your docker machine.__


* run start.sh
* do rest call what you like (e.g. dependency-tester.rest)
* stop.sh

To demo the rest calls I've used Rester plugin for Sublime.


