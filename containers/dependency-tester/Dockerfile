FROM ubuntu

RUN apt-get install -y curl

RUN mkdir /home/tester
COPY service.sh /home/tester/

CMD /home/tester/service.sh