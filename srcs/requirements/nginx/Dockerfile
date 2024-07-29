FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y nginx openssl

COPY ./default /etc/nginx/sites-available/default

RUN openssl req -nodes -x509 -subj \
    "/C=MA/ST=Khouribga/L=Khouribga/O=42/CN=youchen.42.fr" \
    -keyout /etc/ssl/private/youchen.42.fr.key \
    -out /etc/ssl/certs/youchen.42.fr.crt

ENTRYPOINT ["nginx", "-g", "daemon off;"]