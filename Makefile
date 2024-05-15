all : up

up :
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down :
	@docker-compose -f ./srcs/docker-compose.yml down -v

stop :
	@docker-compose -f ./srcs/docker-compose.yml stop

start :
	@docker-compose -f ./srcs/docker-compose.yml start

clean : stop
	@docker-compose -f ./srcs/docker-compose.yml down -v
	@docker system prune -af

re : clean up

status :
	@docker ps