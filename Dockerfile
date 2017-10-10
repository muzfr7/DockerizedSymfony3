FROM php:7.1-apache

MAINTAINER muzafar <muzfr7@gmail.com>

# Enable apache rewrite module
RUN a2enmod rewrite

# libicu-dev (required by intl)
# libpng-dev (required by gd)
# libmcrypt-dev (required by mcrypt)
# libxml2-dev (required by xmlrpc)
# libz-dev (required by memcached)
# libmemcached-dev (required by memcached)

RUN \
	apt-get update && \
	apt-get install nano -y && \
	apt-get install git -y && \
	apt-get install libicu-dev -y && \
	apt-get install libpng-dev -y && \
	apt-get install libmcrypt-dev -y && \
	apt-get install libxml2-dev -y && \
	apt-get install libz-dev -y && \
	apt-get install libmemcached-dev -y && \
	apt-get clean all

RUN docker-php-ext-install \
	mysqli \
	pdo_mysql \
	intl \
	gd \
	zip \
	mcrypt \
	xmlrpc \
	bcmath \
	exif

# Must be installed for Symfony
RUN docker-php-ext-install opcache && docker-php-ext-enable opcache
RUN pecl install xdebug && docker-php-ext-enable xdebug
# for PHP 7+
RUN pecl install apcu && docker-php-ext-enable apcu

# PHP 7+
RUN pecl install memcached

# PHP 5+
# RUN pecl install memcached-2.2.0

# Install composer and symfony installer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
	&& curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony \
	&& chmod a+x /usr/local/bin/symfony

# Add configuration files
COPY etc/php.ini /usr/local/etc/php/php.ini
COPY etc/000-default.conf /etc/apache2/sites-enabled/000-default.conf

#WORKDIR /var/www/html