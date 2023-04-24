FROM php:8.2-apache
RUN apt-get update && apt-get upgrade -y

RUN docker-php-ext-install pdo pdo_mysql
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
COPY ./.docker/php/php.ini /usr/local/etc/php/php.ini

RUN a2enmod rewrite
RUN service apache2 restart

EXPOSE 80