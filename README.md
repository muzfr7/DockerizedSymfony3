# Dockerized Symfony3+
Docker containers configured for you to start developing your Symfony3 applications.

## What's Included?
* PHP 7.1, Apache2, MySQL, Git, Nano, Composer, Symfony Installer
* opcache, apcu, intl, XDebug, pdo_mysql, mcrypt, and more...

## Requirements
You need to have Git, and [Docker](https://www.docker.com/) natively installed on your computer.

## Installation / Setup
Clone this repository somewhere in your computer, for this example i'm cloning it to `~/Developer/` directory
```
$ cd ~/Developer
$ git clone https://github.com/muzfr7/DockerizedSymfony3.git
```
Rename cloned repository with something like your project name and `cd` into it, in my case I am renaming it to `blog`
```
mv DockerizedSymfony3 blog
cd blog
```

### Build and Start Containers
It will take a moment for the first time to build and setup image, subsequent builds from the same image should be faster
```
$ docker-compose up -d
```

### List Containers
Note, use mysql container name 'blog_db_1' as mysql hostname in `blog/www/app/config/parameters.yml` file
```
$ cd ~/Developer/blog
$ docker-compose ps
```
```
        Name                      Command               State            Ports          
---------------------------------------------------------------------------------------
blog_db_1    docker-entrypoint.sh mysqld      Up      0.0.0.0:33060->3306/tcp 
blog_web_1   docker-php-entrypoint apac ...   Up      0.0.0.0:8080->80/tcp 
```
### Access Container
Here `blog_web_1` refers to php:7.1-apache container.
```
$ docker exec -it blog_web_1 bash
```

#### Create New Project
While in `blog_web_1` container shell, create a new symfony project
```
$ cd /var/www/html
$ symfony new symfony-project
```

Move all files off `symfony-project` back to `/var/www/html` directory, and finaly remove `symfony-project` directory
```
$ cd symfony-project
$ mv -f * ../
$ cd ..
$ rm -rf symfony-project
```

## Running
Now head to your browser on your host computer, and navigate to
```
http://localhost:8080
```

## Directory Structure
`etc` miscellaneous file e-g: apache, php configuration.<br />
`mysql` all mysql data will be kept here even if mysql container is removed.<br />
`www` symfony application related code.<br />
