#!/bin/sh
apt-get -y install wget
apt-get -y install unzip
apt-get -y install php5.6-cli php5.6-intl php5.6-curl php5.6-mcrypt php5.6-zip php5.6-xml
mkdir temp
cd temp
wget http://joomlacode.org/gf/download/frsrelease/19665/160049/Joomla_3.3.3-Stable-Full_Package.zip
mkdir -p /var/www/html/joomla
unzip -q Joomla_3.3.3-Stable-Full_Package.zip -d /var/www/html/joomla
chown -R www-data.www-data /var/www/html/joomla
chmod -R 755 /var/www/html/joomla
