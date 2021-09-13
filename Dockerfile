FROM php:fpm-buster
# Override stop signal to stop process gracefully
# https://github.com/php/php-src/blob/17baa87faddc2550def3ae7314236826bc1b1398/sapi/fpm/php-fpm.8.in#L163
# Override stop signal to stop process gracefully
# https://github.com/php/php-src/blob/17baa87faddc2550def3ae7314236826bc1b1398/sapi/fpm/php-fpm.8.in#L163
ENV APP_ENV=${APP_ENV:-prod} \
    XDEBUG_MODE=${XDEBUG_MODE:-off}

RUN apt update && apt upgrade -y && apt install -y apt-utils \
    && apt install -y lsb-release ca-certificates apt-transport-https software-properties-common \
    && apt install -y wget curl cron git unzip gnupg2 build-essential && apt install -y nginx \
    && apt install -y libicu-dev && apt-get install g++ && rm -rf /tmp/pear \
    && apt -y full-upgrade && apt -y autoremove && ln -s /var/log/nginx/ `2>&1 nginx -V | grep -oP "(?<=--prefix=)\S+"`/logs

RUN docker-php-source extract \
    && pecl install xdebug \
    && pecl install -o -f redis \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install intl \
    && docker-php-ext-enable redis \
    && docker-php-ext-enable intl \
    && docker-php-source delete
# COPY ./config/php.ini-production /usr/local/etc/php/php.ini-production

WORKDIR /
COPY config/custom.ini /usr/local/etc/php/conf.d/custom.ini
COPY config/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY main /main
STOPSIGNAL SIGQUIT

EXPOSE 9000 8080
CMD ["php-fpm"]

