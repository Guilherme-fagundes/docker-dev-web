FROM php:8.2-apache
RUN apt-get update && apt-get upgrade -y

RUN apt-get install wget -y
RUN apt-get install curl -y

RUN docker-php-ext-install pdo pdo_mysql
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
COPY ./.docker/php/php.ini /usr/local/etc/php/php.ini

# Install browscap
RUN mkdir -p /usr/local/etc/php/extra/
RUN curl "http://browscap.org/stream?q=Full_PHP_BrowsCapINI" -o /usr/local/etc/php/extra/full_php_browscap.ini


RUN a2enmod rewrite
RUN service apache2 restart

#install composer
RUN wget https://getcomposer.org/download/2.5.5/composer.phar
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

# install nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install nodejs -y

EXPOSE 80