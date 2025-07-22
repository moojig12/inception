<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'naraa' );

/** Database password */
define( 'DB_PASSWORD', 'meow' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'lXeKNA!q]jzG=:q7fNr!]-&Y.mN,`?D? >aygIfr0MThYI#0sKNv1-xBql0FHn*_' );
define( 'SECURE_AUTH_KEY',   '{?jF<D5}Iq[ k4c2M12IR~B5)Fc1NkxL|KmVMjF|/tfSIT^1oogp<2:/s-m=4>]%' );
define( 'LOGGED_IN_KEY',     'e>MgB06{C]SX5sC&2*u$G>WQ%Nes8upaf-amk71K|p./Uou*BB-X^tTah}`6FSew' );
define( 'NONCE_KEY',         'fx[.@)qK?:vX};h[7l#QuV9#AgSj<eS>>i(H7|uRGo^I</6a2uCl!4S[Bs0zt)`d' );
define( 'AUTH_SALT',         'ZT;LQDO{+Tt}TUcDB=& <q]*aV_[kN3&MP@SLKpb$h PBeYI-49$RynBvYW?8D`,' );
define( 'SECURE_AUTH_SALT',  '!qz}n+5[+_cROB[,}T#i{iL3o](]PvRIxdpWO$s:T`K{B?T:xpG_{L.qr!6%dc6R' );
define( 'LOGGED_IN_SALT',    'Ig1vpugV}_}])UMJ8G<%2L2;0~o_AnxQ x1gI*.)/I}O/Bh%XUml1bGGUfhxe2[7' );
define( 'NONCE_SALT',        'xV,K~y|]9{xU4I7K7mRVbP-?R[0m!0YX)f^nc5DQC>yc+8]ZOALR>ZwP(4eP;y]<' );
define( 'WP_CACHE_KEY_SALT', '[ycTuL&qY&KvK/p=u}^n@j|;v]Y;xIXH=YEu(hv`MpdB*g$rz8 h?+%;|C2DIR)V' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
