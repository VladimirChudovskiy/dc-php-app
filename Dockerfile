FROM php:7.3-fpm-alpine

WORKDIR /var/www

RUN apk add --update --no-cache libzip-dev \
    && docker-php-ext-configure zip --with-libzip=/usr/include \
    && docker-php-ext-install zip \
    # intl, soap
    && apk add --update --no-cache libintl icu icu-dev libxml2-dev \
    && docker-php-ext-install intl soap \
    # mysqli, pdo, pdo_mysql
    && docker-php-ext-install mysqli pdo pdo_mysql \
    # gd, iconv
    && apk add --update --no-cache freetype-dev libjpeg-turbo-dev libpng-dev \
    && docker-php-ext-install iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    # gmp, bcmath
    && apk add --update --no-cache gmp gmp-dev \
    && docker-php-ext-install gmp bcmath \
    # redis, apcu
    && docker-php-source extract \
    && apk add --no-cache --virtual .phpize-deps-configure $PHPIZE_DEPS \
    && pecl install redis \
    && pecl install apcu \
    && docker-php-ext-enable redis apcu \
    && apk del .phpize-deps-configure \
    && docker-php-source delete \
    # imagick
    && apk add --update --no-cache autoconf g++ imagemagick-dev libtool make pcre-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && apk del autoconf g++ libtool make pcre-dev \
    # exif
    && docker-php-ext-install exif \
    # git client, mysql-client
    && apk add --update --no-cache git mysql-client \
    # pcntl
    && docker-php-ext-install pcntl \
    # composer
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
    # node && npm
    && apk add --update nodejs npm
