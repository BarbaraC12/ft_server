# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init_server.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bcano <bcano@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/14 17:04:28 by bcano             #+#    #+#              #
#    Updated: 2021/02/14 17:04:31 by bcano            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

echo "<?php phpinfo(); ?>" >> /var/www/html/index.php

mkdir /etc/nginx/ssl
openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=IDF/L=PARIS/O=42 School/OU=bcano/CN=localhost" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

service mysql start

echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
echo "update mysql.user set plugin='' where user='root';"| mysql -u root --skip-password

cd /var/www/html/
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
tar -xvf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
mv phpMyAdmin-5.0.1-english/  phpmyadmin/
mv /tmp/config.inc.php /var/www/html/phpmyadmin/
rm /var/www/html/phpmyadmin/config.sample.inc.php
cd ../../../../

cd /tmp/
wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz && rm -rf latest.tar.gz
mv wordpress/ ../var/www/html/
mv /tmp/wp-config.php /var/www/html/wordpress/
cd ../
rm /var/www/html/wordpress/wp-config-sample.php
mkdir /var/www/html/phpmyadmin/tmp

chown -R www-data /var/www/*
chmod -R 755 /var/www/*

service php7.3-fpm start
service nginx start

bash
