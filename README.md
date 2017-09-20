# Symfony Container
SymfonyContainer gives you everything you need to quickly start developing your Symfony applications.

### What's Included ?
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

### Requirements
You need to have Git, and [Docker](https://www.docker.com/) natively installed on your computer.

### Installation
Use git to clone this repository some where e-g: `~/Developer/`
```
$ git clone https://github.com/muzfr7/SymfonyContainer.git
```

Once closed it will create a folder named `SymfonyContainer`, this will be the basis for your docker container names, you can change it to an appropriate one. Next, change directory into it e-g: `$ cd SymfonyContainer`.

Great, run following command to build and start your containers
```
$ docker-compose up -d
```