FROM php:8.2.11 as php

RUN apt-get update -y
RUN apt-get install -y unzip libpq-dev libcurl4-gnutls-dev
RUN docker-php-ext-install pdo pdo_mysql bcmath

WORKDIR /var/wwws
COPY . .

COPY --from=composer:2.6.5 /usr/bin/composer /usr/bin/composer

ENV PORT = 8000
ENTRYPOINT [ "docker/entrypoint.sh" ]

# ==================================================================================
# node
FROM node:18.18.0 as node

WORKDIR /var/www
COPY . .

RUN npm install --global cross-env
RUN npm install

VOLUME /var/www/node_modules