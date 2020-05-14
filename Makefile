build:
	docker-compose build --no-cache

up:
	open -a Xquartz
	xhost +$(hostname)
	docker-compose up -d

down:
	docker-compose down

restart:
	make down
	make up

destroy:
	docker-compose down --rmi all --volumes
	
destroy-volumes:
	docker-compose down --volumes

ps:
	docker-compose ps

bash:
	docker-compose exec app bash

xeyes:
	docker-compose exec app bash -c 'xeyes'

binary:
	docker-compose exec app bash -c 'binary'