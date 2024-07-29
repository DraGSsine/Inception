FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y curl

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - 

RUN apt-get install nodejs -y

COPY ./joke.sh /joke.sh

COPY ./app /app

RUN chmod +x /joke.sh

ENTRYPOINT ["./joke.sh"]
