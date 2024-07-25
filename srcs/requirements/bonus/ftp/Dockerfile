FROM debian:bullseye

RUN apt-get update && apt-get upgrade

RUN apt-get install -y vsftpd

COPY ./ftp-config.sh /ftp-config.sh

RUN chmod +x /ftp-config.sh

ENTRYPOINT [ "./ftp-config.sh" ]