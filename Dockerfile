# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bcano <bcano@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/14 17:01:10 by bcano             #+#    #+#              #
#    Updated: 2021/02/14 17:01:19 by bcano            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update -y && apt-get install -y procps vim wget 
RUN apt-get upgrade -y 
RUN apt-get install -y nginx openssl mariadb-server php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap

COPY ./srcs/init_server.sh ./
COPY ./srcs/default ./etc/nginx/sites-available/
COPY ./srcs/index.html ./var/www/html
COPY ./srcs/config.inc.php ./tmp/config.inc.php
COPY ./srcs/wp-config.php ./tmp/wp-config.php

EXPOSE 80 443

CMD bash init_server.sh
