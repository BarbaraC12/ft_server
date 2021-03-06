# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    config.inc.php                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bcano <bcano@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/14 17:02:00 by bcano             #+#    #+#              #
#    Updated: 2021/02/14 17:02:12 by bcano            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

<?php

declare(strict_types=1);

$cfg['blowfish_secret'] = 'abcdefghijklmnopqrstuvwxyz0123456789';

$i = 0;

$i++;

$cfg['Servers'][$i]['auth_type'] = 'cookie';

$cfg['Servers'][$i]['host'] = 'localhost';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;
