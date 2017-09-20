# Symfony Container
SymfonyContainer gives you everything you need to quickly start developing your Symfony applications.

## What's Included ?
* PHP 7.1
* Apache2
* MySQL
* Git
* Nano
* Composer
* Symfony Installer

* opcache
* apcu
* intl
* xdebug
* pdo
* pdo_mysql
* mcrypt
* and more...

## Requirements
You need to have Git, and [Docker](https://www.docker.com/) natively installed on your computer.

## Installation
Use git to clone this repository some where e-g: `~/Developer/`
```
$ git clone https://github.com/muzfr7/SymfonyContainer.git
```

Once cloned, it will create a folder named `SymfonyContainer`, this will be the basis for your docker container names, you can change it to an appropriate one. Next, change directory into it e-g: `$ cd SymfonyContainer`.

Great, run following command to build and start your containers
```
$ docker-compose up -d
```

### List Containers
This command will display all created containers, here name of container would be hostname of that container in another container.
```
$ docker-compose ps
```
```
        Name                      Command               State            Ports          
---------------------------------------------------------------------------------------
symfonycontainer_db_1    docker-entrypoint.sh mysqld      Up      0.0.0.0:33060->3306/tcp 
symfonycontainer_web_1   docker-php-entrypoint apac ...   Up      0.0.0.0:8080->80/tcp 
```
### Access Container
```
$ docker exec -it symfonycontainer_web_1 bash
```
### Create New Project
While in your container, change directory into webroot and create new symfony application
```
$ cd /var/www/html
$ symfony new .
```

## Running
Now head back to your host computer's browsers, and access your symfony application on
```
http://localhost:8080
```