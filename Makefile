PATH_YML = ./docker-compose.yml
RED = "\033[1;31m"
GREEN = "\033[1;32m"
YELLOW = "\033[1;33m"

ifneq (,$(wildcard srcs/requirements/tools/data_path.txt))
	path_file := srcs/requirements/tools/data_path.txt
	variable := $(shell cat ${path_file})
	wordpress_path := $(shell echo ${variable}/wordpress)
	mariadb_path := $(shell echo ${variable}/mariadb)
endif


all:
ifeq (,$(wildcard ./srcs/requirements/tools/data_path.txt))
	@bash requirements/tools/config.sh
	@echo "Good!"
	@echo "Use make to launch"
else
ifeq (,$(wildcard $(mariadb_path)))
	@mkdir -p $(mariadb_path)
	@mkdir -p $(wordpress_path)
	@chmod 777 $(mariadb_path)
	@chmod 777 $(wordpress_path)
endif
	@echo "Starting Inception..."
	@sleep 1
	@docker-compose -f $(PATH_YML) up -d --build
endif

re: clean all

stop:
	@docker-compose -f $(PATH_YML) stop


clean: stop
	@docker-compose -f $(PATH_YML) down -v

fclean: clean
	@rm -rf $(wordpress_path)
	@rm -rf $(mariadb_path)
	@docker system prune -af

reset: clean
	@rm requirements/tools/data_path.txt
	@printf "\nPath is reset\n"

config:
	@bash requirements/tools/config.sh