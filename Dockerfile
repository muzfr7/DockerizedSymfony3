FROM php:7.1-apache

MAINTAINER muzafar <muzfr7@gmail.com>

# Enable apache rewrite module
RUN a2enmod rewrite

RUN apt-get update \

	&& apt-get install -y \
		nano \
		git \
		libicu-dev \
		libpq-dev \
		libmcrypt-dev \
		libxslt-dev \

	&& pecl install apcu \
	&& pecl install xdebug \

	&& docker-php-ext-install \
		intl \
		opcache \
		mysqli \
		pdo_mysql \
		sockets \
		mcrypt \
		xmlrpc \

	&& docker-php-ext-enable \
        opcache \
		apcu \
		xdebug

# Install composer and symfony installer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
	&& curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony \
	&& chmod a+x /usr/local/bin/symfony

# Add configuration files
COPY etc/php.ini /usr/local/etc/php/php.ini
COPY etc/000-default.conf /etc/apache2/sites-enabled/000-default.conf

#WORKDIR /var/www/html