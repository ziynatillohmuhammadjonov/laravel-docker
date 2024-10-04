FROM php:8.2-fpm-alpine

WORKDIR /var/www/laravel

# Установка необходимых пакетов и PHP-расширений
RUN apk --no-cache add \
        libzip-dev \
        zlib-dev \
    && docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-install zip

# Очистка ненужных файлов, чтобы уменьшить размер образа
RUN apk del --no-cache \
        libzip-dev \
        zlib-dev
