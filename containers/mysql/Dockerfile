FROM mysql

RUN apt-get update && apt-get install -y nano curl

COPY checkDbStatus.sh /
COPY verifyStartup.sh /

RUN chmod +x /verifyStartup.sh
RUN chmod +x /checkDbStatus.sh

ENTRYPOINT /verifyStartup.sh
