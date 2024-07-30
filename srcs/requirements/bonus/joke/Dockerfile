FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y wget

RUN wget https://deb.nodesource.com/setup_18.x -O setup.sh

RUN bash setup.sh

RUN apt-get install nodejs -y

COPY ./joke.sh /joke.sh

COPY ./app /app

RUN chmod +x /joke.sh

ENTRYPOINT ["./joke.sh"]
