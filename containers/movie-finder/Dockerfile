FROM vtajzich/java:oracle-java8
MAINTAINER Vitek Tajzich <v.tajzich@vendavo.com>
RUN mkdir /home/app
ADD build/distributions/the-application.tar /home/app/

EXPOSE 8080

CMD /home/app/the-application/bin/the-application
