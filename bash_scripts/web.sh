#!/bin/bash

sudo apt-get update
sudo apt-get install -y apache2

#Allow incoming traffic
sudo ufw allow in "Apache Full"

sudo apt-get update
sudo apt-get install -y php5 libapache2-mod-php5 php5-mcryp

#sudo apt-get install -y php7.2
#sudo apt-get install -y php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml

sudo mkdir wp
cd wp

sudo wget https://ru.wordpress.org/wordpress-4.9.8-ru_RU.tar.gz
sudo tar xf wordpress-4.9.8-ru_RU.tar.gz
sudo mv wordpress/* ../
cd ../
sudo rm -r wp
sudo sed -i 's/'localhost'/'172.16.0.2'/g' /var/www/html/wp-config-sample.php
#sudo sed -i 's/'username_here'/'root'/g' /var/www/html/wp-config-sample.php
#sudo sed -i 's/'password_here'/'root'/g' /var/www/html/wp-config-sample.php
#sudo sed -i 's/'database_name_here'/'wp_db'/g' /var/www/html/wp-config-sample.php

#sudo a2enmodrewrite
sudo service apache2 restart
