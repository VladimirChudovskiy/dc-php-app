FROM php:7.2-fpm-alpine

WORKDIR /var/www

RUN docker-php-ext-install pdo pdo_mysql && \
         apk --update add wget \
         curl \
         git \
         php7 \
         php7-curl \
         php7-openssl \
         php7-iconv \
         php7-json \
         php7-mbstring \
         php7-phar && \
         curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
         apk add --update nodejs npm