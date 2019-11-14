up:
	docker-compose up -d --build

down:
	docker-compose down

update:
	docker exec -it app bash -c 'composer install'
	docker exec -it app bash -c 'npm install'
	docker exec -it app bash -c 'php artisan migrate'

console:
	docker exec -it app /bin/bash