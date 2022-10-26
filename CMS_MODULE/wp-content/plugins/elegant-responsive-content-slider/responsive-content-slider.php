<?php
/*
Plugin Name: Elegant Responsive Content Slider
Plugin URI: http://wordpress.org/plugins/elegant-responsive-content-slider/
Description: jQuery Responsive content slider plugin to build elegant, beautiful and fully-loaded slider on different posts or pages by SHORTCODE.
Version: 1.0.2
Author: Realwebcare
Author URI: http://profiles.wordpress.org/realwebcare/
Text Domain: ercs
Domain Path: /languages/
*/

/*  Copyright 2020  Realwebcare  (email : realwebcare@gmail.com)

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License, version 2, as 
    published by the Free Software Foundation.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly
ob_start();
define('ERCS_PLUGIN_PATH', plugin_dir_path( __FILE__ ));

/* Internationalization */
function ercs_textdomain() {
	$domain = 'ercs';
	$locale = apply_filters( 'plugin_locale', get_locale(), $domain );
	load_textdomain( $domain, trailingslashit( WP_LANG_DIR ) . $domain . '/' . $domain . '-' . $locale . '.mo' );
	load_plugin_textdomain( $domain, FALSE, basename( dirname( __FILE__ ) ) . '/languages/' );
}
add_action( 'init', 'ercs_textdomain' );
/* Add plugin action links */
function ercs_plugin_actions( $links ) {
	$links[] = '<a href="'.menu_page_url('ercs-settings', false).'">'. __('Settings','ercs') .'</a>';
	$links[] = '<a href="https://wordpress.org/support/plugin/elegant-responsive-content-slider" target="_blank">'. __('Support','ercs') .'</a>';
	return $links;
}
add_filter( 'plugin_action_links_' . plugin_basename(__FILE__), 'ercs_plugin_actions' );
/* Enqueue CSS & JS For Admin */
function ercs_admin_adding_style() {
	wp_register_script( 'ercs-admin', plugin_dir_url( __FILE__ ) . '/assets/js/ercs-admin.min.js', '1.0.2', true );
	wp_enqueue_script( 'ercs-admin' );
	wp_localize_script( 'ercs-admin', 'ercsajax', array( 'ajaxurl' => admin_url( 'admin-ajax.php' ) ) );
	wp_enqueue_script( 'jquery-ui-tabs' );
	wp_enqueue_script( 'wp-color-picker' );
	wp_enqueue_media();
	wp_enqueue_style( 'wp-color-picker' );
	wp_enqueue_style( 'jquery-ui-css', plugins_url( '/assets/css/jquery-ui.css', __FILE__ ), '', '1.12.0', false );
	wp_enqueue_style( 'ercs_admin_style', plugins_url('/assets/css/ercs-admin.css', __FILE__),'','1.0.2', false );
}
add_action( 'admin_enqueue_scripts', 'ercs_admin_adding_style' );
require_once dirname( __FILE__ ) . '/slider-shortcode.php';
require_once dirname( __FILE__ ) . '/class/ercs_aq_resizer.php';
require_once dirname( __FILE__ ) . '/inc/ercs-admin.php';
require_once dirname( __FILE__ ) . '/inc/ercs-sidebar.php';
?>