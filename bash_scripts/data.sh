#!/bin/bash


sudo apt-get update
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'


sudo apt-get install -y mysql-server mysql-client php5-mysql
#sudo apt-get install -y mysql-server mysql-client
#sudo mysql_install_db
#sudo mysql_secure_installation

mysql -u root -p"root" -e "CREATE DATABASE web_data;
CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';
CREATE USER 'root'@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON * . * TO 'root'@'localhost';
GRANT ALL PRIVILEGES ON * . * TO 'root'@'%';
FLUSH PRIVILEGES;"

#sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
bind-address   = 0.0.0.0
sudo service mysql restart
