FROM php:7.1-apache

MAINTAINER muzafar <muzfr7@gmail.com>

RUN apt-get update

RUN apt-get install -y nano
RUN apt-get install -y git

# Install OPCache
RUN docker-php-ext-install opcache

# Install APCU
RUN pecl install apcu
RUN docker-php-ext-enable apcu

# Install intl
RUN apt-get install -y libicu-dev
RUN pecl install intl
RUN docker-php-ext-install intl

# Install XDebug
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

# Install PDO
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mysqli

# Install mcrypt
RUN apt-get install -y libmcrypt-dev
RUN docker-php-ext-install mcrypt

# Install XSL
RUN apt-get install -y libxslt-dev
RUN docker-php-ext-install xsl

# Other extensions
RUN docker-php-ext-install json
RUN docker-php-ext-install xml
RUN docker-php-ext-install simplexml
RUN docker-php-ext-install xmlrpc
RUN docker-php-ext-install phar
RUN docker-php-ext-install dom
RUN docker-php-ext-install zip
RUN docker-php-ext-install ctype
RUN docker-php-ext-install gd
RUN docker-php-ext-install iconv

# Enable Apache rewrite module
RUN a2enmod rewrite

# Install Symfony Installer
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

COPY etc/php.ini /usr/local/etc/php/php.ini
COPY etc/000-default.conf /etc/apache2/sites-enabled/000-default.conf




