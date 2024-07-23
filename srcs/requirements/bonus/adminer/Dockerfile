FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install curl php -y

COPY ./adminer-setup.sh /adminer-setup.sh

RUN chmod +x /adminer-setup.sh

ENTRYPOINT ["./adminer-setup.sh"]
