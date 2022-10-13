all:
	docker-compose -f srcs/docker-compose.yml down
	rm -rf ${HOME}/data
	docker system prune -f
	docker-compose -f srcs/docker-compose.yml up --build

.PHONY: all
