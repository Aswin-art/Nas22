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
define( 'DB_USER', 'root' );

/** Database password */
define( 'DB_PASSWORD', '' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

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
define( 'AUTH_KEY',         'ior2]OLJe7@;qCw+rVXKCN^.9^rW_x*(TO!^WV mX6`cA$c;rX7ln}cO>b[[Mj9L' );
define( 'SECURE_AUTH_KEY',  'N4~|H}okM,Yg@ixWWURr-[.YhYd ._8ws-07*N-:Xo82>_s2LmD]=`/UXW-CyKzn' );
define( 'LOGGED_IN_KEY',    'g2*421gvKY`{,NDXHFKJyEFY@F8b_ygc(!d:D_6yaKz?m!oKgoR+~~7]i_Z}/1c)' );
define( 'NONCE_KEY',        '6?iga9FR=$]r)IrtvuW=-dBF6L_.cdoQ(`?Rx.0o.WnaCy<CzqLFDPu)4MKcP}2!' );
define( 'AUTH_SALT',        '~2#J(U9Ct9jyY6Yr46OLgXV2shAO[apodb3CPK<X=*]@g`@gns<)fjw_X/34A-hl' );
define( 'SECURE_AUTH_SALT', '1OQ8d3g`.R8J= Y_Uy[(ZiYNIeW{~Kg67KK+/1MS&>uh&8+LC^r(xBr!-q]xizFv' );
define( 'LOGGED_IN_SALT',   '1q@w[%l~z,5>#C;1u6]-k6/K@>}+`Mj||G_@XM!`s]caK@@XJUU:(+~l$h!s]qj$' );
define( 'NONCE_SALT',       '^te`LQ2Uk_/46dW7ZpA<?QeN{iq>18o.t^@G#Am`Gafy?phg4BBT/uVrV$-`QGFc' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

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
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
