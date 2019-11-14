## How to start
1. Create folder `src`
2. Install your php application into that (`src`) folder
3. Public directory of your project should be `src/public` if it isn't so than change `nginx/default.conf`
4. Run `docker-compose build`
5. Run `docker-compose up -d` OR `make up`
6. To stop it use the following command `make down` 
7. Enjoy it!

## For laravel application
`make up` - set up all containers

`make down` - set down all containers

`make update` - update all dependencies and run migrations

`make migrate` - run migrations

`make console` - move you into the app container 