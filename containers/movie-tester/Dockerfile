FROM ubuntu

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install curl

RUN mkdir /home/tester

COPY test.sh /home/tester/

RUN chmod +x /home/tester/test.sh

CMD /home/tester/test.sh
