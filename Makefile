WP_DATA = /home/youchen/data/wordpress
DB_DATA = /home/youchen/data/mariadb

all: up

up: build
	-mkdir -p $(WP_DATA)
	-mkdir -p $(DB_DATA)
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

start:
	docker-compose -f ./srcs/docker-compose.yml start

build:
	docker-compose -f ./srcs/docker-compose.yml build


clean:
	-docker stop $$(docker ps -aq)
	-docker rm $$(docker ps -aq)
	-docker rmi -f $$(docker images -q)
	-docker volume rm $$(docker volume ls -q)
	-docker network rm inception
	-rm -rf $(WP_DATA)
	-rm -rf $(DB_DATA)

re: clean up

prune: clean
	-docker system prune -a --volumes -f