up:
	docker-compose up -d --build

down:
	docker-compose down

update:
	docker exec -it app /bin/sh -c 'composer install'
	docker exec -it app /bin/sh -c 'npm install'
	docker exec -it app /bin/sh -c 'php artisan migrate'

migrate:
	docker exec -it app /bin/sh -c 'php artisan migrate'

console:
	docker exec -it app /bin/sh