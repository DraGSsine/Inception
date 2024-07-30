FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y wget php php7.4-fpm php-mysql php-redis

COPY ./wp-config.sh /wp-config.sh

RUN chmod +x /wp-config.sh

ENTRYPOINT ["./wp-config.sh"]