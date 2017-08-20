FROM php:fpm
RUN pecl install xdebug
ADD settings/xdebug.ini /usr/local/etc/php/conf.d/
RUN docker-php-ext-install pdo_mysql
