FROM php:5.6-apache

MAINTAINER Jan Löffler <mail@jlsoft.de>

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

COPY / /var/www/html/

EXPOSE 8080
EXPOSE 80

CMD ["apache2-foreground"]