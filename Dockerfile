# docker base image for basic programming tools

FROM ubuntu:focal

ENV TZ=Europe/Warsaw
ARG DEBIAN_FRONTEND=noninteractive

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y --no-install-recommends install \
    net-tools openssh-client nano vim-tiny iputils-ping make git \
    php7.4 php7.4-ldap php7.4-pgsql php7.4-xmlrpc php7.4-dev php-pear composer \
    python3 python3-postgresql python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install awscli
RUN pecl install xdebug
RUN pecl channel-update pecl.php.net

VOLUME [ "/root" ]
CMD [ "sh", "-c", "cd; exec bash -i" ]

