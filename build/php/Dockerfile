FROM php:7.1-apache

RUN apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade
RUN apt-get install -y \
            libfreetype6-dev \
            libjpeg62-turbo-dev \
            libjpeg-dev \
            libmcrypt-dev \
            libpng12-dev \
            libxml2-dev \
            libmagickwand-dev \
            zlib1g-dev \
            locales \
            locales-all \
            ghostscript \
            libjpeg62 \
            imagemagick
RUN docker-php-ext-install -j$(nproc) iconv mcrypt \
 && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
 && docker-php-ext-install -j$(nproc) gd \
 && docker-php-ext-install mysqli pdo pdo_mysql zip soap sockets opcache exif


RUN pecl install imagick && docker-php-ext-enable imagick
RUN pecl install apcu && docker-php-ext-enable apcu
RUN pecl install redis && docker-php-ext-enable redis
RUN pecl install igbinary && docker-php-ext-enable igbinary

RUN echo C.UTF-8 UTF-8 >> /etc/locale.gen \
 && echo en_US.UTF-8 UTF-8 >> /etc/locale.gen \
 && echo en_GB.UTF-8 UTF-8 >> /etc/locale.gen \
 && echo en_IE.UTF-8 UTF-8 >> /etc/locale.gen \
 && echo de_DE.UTF-8 UTF-8 >> /etc/locale.gen \
 && locale-gen

RUN rm -rf /var/lib/apt/lists/*
RUN apt-get autoclean -y && apt-get autoremove -y

COPY setup/php/ /usr/local/etc/php/
