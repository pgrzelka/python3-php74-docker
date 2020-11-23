FROM ubuntu:focal

ENV TZ=Europe/Warsaw
ARG DEBIAN_FRONTEND=noninteractive

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y --no-install-recommends install \
    net-tools openssh-client nano vim-tiny iputils-ping make git curl unzip imagemagick \
    php7.4 php7.4-gd php7.4-ldap php7.4-pgsql php7.4-xmlrpc php7.4-mbstring php7.4-curl php7.4-intl php7.4-dev php7.4-imagick php-pear \
    python3 python3-postgresql python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install awscli
RUN pecl channel-update pecl.php.net

RUN curl -fsSL https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer global require phpunit/phpunit 8.3.5 --no-progress --no-scripts --no-interaction

RUN pecl install xdebug \
    && echo 'zend_extension=/usr/lib/php/20190902/xdebug.so' > \
        /etc/php/7.4/cli/conf.d/20-docker-php-ext-xdebug.ini \
    && php -m | grep xdebug

VOLUME [ "/root" ]
CMD [ "sh", "-c", "cd; exec bash -i" ]

