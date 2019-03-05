#!/bin/#!/usr/bin/env bash

if [ $(whoami) != "root" ]; then
    echo "Must run as root user"
    exit;
fi

wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
echo "deb https://packages.sury.org/php/ stretch main" | sudo tee /etc/apt/sources.list.d/php.list


sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y libcurl3
sudo apt-get install -y php7.2 php7.2-curl php7.2-gd php7.2-fpm php7.2-cli php7.2-opcache php7.2-mbstring php7.2-xml php7.2-zip libapache2-mod-php7.2 php7.2-mbstring php7.2-cli php7.2-pgsql php7.2-bcmath php7.2-gd php7.2-curl php7.2-dom  php7.2-soap php7.2-curl php7.2-mysql php7.2-mysqli php7.2-mysqli php7.2-gettext gcc make autoconf libc-dev pkg-config libmcrypt-dev
sudo apt-get install -y apache2 curl apache2-utils
sudo a2enmod rewrite
sudo a2enmod ssl
echo "ServerName localhost" >> /etc/apache2/apache2.conf
service apache2 restart

mkdir -p /etc/ssl/localcerts
openssl req -new -x509 -days 365 -nodes -out /etc/ssl/localcerts/apache.pem -keyout /etc/ssl/localcerts/apache.key
chmod 600 /etc/ssl/localcerts/apache*

sudo apt-get install -y mysql-client
