all:
	docker-compose -f srcs/docker-compose.yml down
	rm -rf ${HOME}/data
	docker system prune -f
	docker-compose -f srcs/docker-compose.yml up --build

host:
	-- sh -c 'echo "127.0.0.1 jjeong.42.fr" >> /etc/hosts'

.PHONY: all
