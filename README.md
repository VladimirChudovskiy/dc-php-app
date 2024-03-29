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


## Tips and tricks
### Use ready database structure and data 
If you want to use databases with some data you should follow next steps:
1. Create folder `dbdata`.
2. Put file with dump into that directory. File should have name `dump.sql`.
3. Run `make dbup` command.
When you stop working on the project and want to save db state for future follow next steps:
1. Run `make dbdump` before `make down`.

## Acknowledgement
While I was creating this repository I used ideas of other developers and I want to say `thank you` to
- Mohammad Shahgolzadeh https://github.com/m2sh
- Serhii Lysak https://github.com/iihres
- Other developer who share their knowledge