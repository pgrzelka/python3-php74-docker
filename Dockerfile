# docker base image for basic programming tools

FROM ubuntu:focal

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y --no-install-recommends install \
    net-tools telnet traceroute openssh-client nano vim-tiny iputils-ping php php-ldap php-json \
    php-mail php-mcrypt php-mysql php-pgsql php-snmp php-sqlite3 php-ssh2 php-xmlrpc php7.4 \
    php7.4-ldap php7.4-mysql php7.4-pgsql php7.4-xmlrpc \
    python python3 python-pymysql python3-pymysql python-pygresql python3-postgresql \
    python-pysnmp4 python3-pysnmp4 python-ldap3 python3-ldap3 \
    libdbd-ldap-perl libnet-ssh2-perl\ 
    && rm -rf /var/lib/apt/lists/*

VOLUME [ "/root" ]
CMD [ "sh", "-c", "cd; exec bash -i" ]

