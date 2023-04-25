FROM php:8.2-apache
RUN apt-get update && apt-get upgrade -y

RUN apt-get install wget

RUN docker-php-ext-install pdo pdo_mysql
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
COPY ./.docker/php/php.ini /usr/local/etc/php/php.ini

RUN a2enmod rewrite
RUN service apache2 restart

#install composer
RUN wget https://getcomposer.org/download/2.5.5/composer.phar
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

EXPOSE 80