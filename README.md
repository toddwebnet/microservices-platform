Basic Docker setup

```
git submodule init
git submodule update
cd adminer/devops && ./deploy.sh && cd ../../
cd docker
cp .env.example .env
```
the only real thing to change here is at the top
```
APP_PATH=/home/jtodd/platform
DOCKER_PATH=.
TIMEZONE=UTC
COMPOSE_PROJECT_NAME=platform
```
update APP_PATH
update project name to something unique to this project

then run
```
cd ~/docker
docker-compose build
```
and go get a cup of coffee, drink it, and get another cup of coffee

host file changes
```
127.0.0.1 adminer.dev.idevcode.com
```

now run:
```
cd ~/docker
docker-compose up
```
now test it by going to
http://adminer.dev.idevcode.com
host: mysql (yes the word mysql is the server name)
username: root
password: password

hopefully, it works!

so... you will see that docker is still running in your command window
hit Ctl-c to stop it
to restart it in daemon mode:
```
cd ~/docker
docker-compose up -d
```
to stop it
```
cd ~/docker
docker-compose down
```

to setup auth-server
outside of docker
```
cd auth-server/devops
./deploy-conf.sh
```

host file changes
```
127.0.0.1 auth.dev.idevcode.com
```
start/restart docker
I haven't figured out how to transfer ssh keys... so run composer install outside of docker Workspace
there is a library that is setup to use github
```
cd ~/auth-server
composer install
```
run this inside a docker workspace
```
cd docker
docker-compose exec -udocker workspace bash
cd auth-server/devops
./deploy-database
cd ..
cp .env.example .env
php artisan key:generate
php artisan migrate
php artisan db:seed
```
you can test the site at:
http://auth.pi.idevcode.com

you can test this using postman
POST to:
http://auth.pi.idevcode.com/authenticate
username:root
password:password

......................................................................

to add internal dns names:
add ~/docker/docker-compose.override.yml
```
version: '3'

services:
### Workspace Utilities ##################################
  workspace:
    links:
      - "nginx:adminer.dev.idevcode.com"
      - "mysql:mysql.name.domain.com"
```

......................................................................

to get to command line inside docker
```
cd ~/docker
docker-compose run exec -udocker workspace bash
```
