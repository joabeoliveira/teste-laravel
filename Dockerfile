FROM php:8.4-cli-alpine AS builder
WORKDIR /app
RUN apk add --no-cache curl bash openssl
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer create-project --no-interaction laravel/laravel .

FROM php:8.4-fpm-alpine
WORKDIR /var/www/html
COPY --from=builder /app /var/www/html
RUN apk add --no-cache bash shadow postgresql-libs
RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS postgresql-dev \
	&& docker-php-ext-install pdo_pgsql \
	&& apk del .build-deps
RUN chown -R www-data:www-data /var/www/html || true
EXPOSE 8000
CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
