FROM composer:2 AS builder
WORKDIR /app
RUN composer create-project --no-interaction laravel/laravel .

FROM php:8.1-fpm-alpine
WORKDIR /var/www/html
COPY --from=builder /app /var/www/html
RUN apk add --no-cache bash shadow
RUN chown -R www-data:www-data /var/www/html || true
EXPOSE 8000
CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
