FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y vsftpd

RUN mkdir -p /var/run/vsftpd/empty

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/setup.sh ./

RUN chmod +x setup.sh

ENTRYPOINT [ "./setup.sh" ]