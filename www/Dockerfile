FROM php:7.1-apache

MAINTAINER muzafar <muzfr7@gmail.com>

# Enable apache rewrite module
RUN a2enmod rewrite

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get update && apt-get install -y \
	nano \
	git \
	libicu-dev \
	libmcrypt-dev \
	libxslt-dev

RUN pecl install \
	apcu \
	intl \
	xdebug

RUN docker-php-ext-install \
	opcache \
	intl \
	pdo \
	pdo_mysql \
	mcrypt \
	xsl \
	json \
	xml \
	simplexml \
	xmlrpc \
	phar \
	dom \
	zip \
	ctype \
	gd \
	iconv

RUN docker-php-ext-enable \
	apcu \
	xdebug

# Install Symfony Installer
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

# Add configuration files
COPY etc/php.ini /usr/local/etc/php/php.ini
COPY etc/000-default.conf /etc/apache2/sites-enabled/000-default.conf