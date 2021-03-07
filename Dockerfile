FROM php:7.4-apache


# Fix locale problem
RUN apt-get update && apt-get install locales locales-all -y

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

COPY ./app /var/www/html

# Apache mod_rewrite
RUN a2enmod rewrite


# Php config install extensions

# RUN pecl config-set php_ini "$PHP_INI_DIR/php.ini"
RUN apt-get update && apt-get install -y \
        libicu-dev --no-install-recommends && \
    # pecl channel-update pecl.php.net && \
    docker-php-ext-configure intl &&  \
    docker-php-ext-install intl mysqli && \
    docker-php-ext-enable mysqli
