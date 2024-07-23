FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y redis

COPY ./redis-conf.sh /redis-conf.sh

RUN chmod +x /redis-conf.sh

ENTRYPOINT [ "./redis-conf.sh" ]