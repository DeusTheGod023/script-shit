#!/bin/bash

echo "Start Sript"
echo "Ignore this shit"

yum -y install httpd
systemctl start httpd
systemctl status httpd

mkdir /etc/httpd/sites-available /etc/httpd/sites-enabled
echo "IncludeOptional sites-enabled/*.conf" >> /etc/httpd/conf/httpd.conf

mkdir /var/www/

systemctl restart httpd

yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm

yum -y install yum-utils
yum-config-manager --disable 'remi-php*'
yum-config-manager --enable remi-php74

yum -y update
yum -y install php php-cli

yum -y install php  php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json

php -v
systemctl status httpd
echo "This script is a shit, so thats all"