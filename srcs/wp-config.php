# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    wp-config.php                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bcano <bcano@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/14 17:04:33 by bcano             #+#    #+#              #
#    Updated: 2021/02/14 17:04:39 by bcano            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

<?php

define( 'DB_NAME', 'wordpress' );

define( 'DB_USER', 'root' );

define( 'DB_PASSWORD', '' );

define( 'DB_HOST', 'localhost' );

define( 'DB_CHARSET', 'utf8' );

define( 'DB_COLLATE', '' );

define( 'AUTH_KEY',         'put your unique phrase here' );
define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
define( 'NONCE_KEY',        'put your unique phrase here' );
define( 'AUTH_SALT',        'put your unique phrase here' );
define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
define( 'NONCE_SALT',       'put your unique phrase here' );

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

require_once( ABSPATH . 'wp-settings.php' );
