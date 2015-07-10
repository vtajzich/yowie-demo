FROM ubuntu

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install mysql-client curl

RUN mkdir /home/db

COPY create_db.sql /home/db/
COPY dvd.csv /home/db/
COPY setup_db.sh /home/db/

RUN chmod +x /home/db/setup_db.sh

CMD /home/db/setup_db.sh