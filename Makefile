DATA_PATH = home/debian/data
DATA_DEL = home

all: up

up:
	@sudo mkdir -p $(DATA_PATH)/wordpress
	@sudo mkdir -p $(DATA_PATH)/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up -d

down:
	@docker-compose -f ./srcs/docker-compose.yml down

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

start:
	@docker-compose -f ./srcs/docker-compose.yml start

ps:
	@docker ps

clean:
	@docker-compose -f ./srcs/docker-compose.yml down -v
	@sudo docker system prune -af
	@sudo rm -rf $(DATA_DEL)
	
re: clean up
