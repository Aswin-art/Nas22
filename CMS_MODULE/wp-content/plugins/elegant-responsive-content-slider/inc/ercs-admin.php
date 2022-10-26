<?php
/*
 * Elegant Responsive Content Slider 1.0.2
 * By @realwebcare - https://www.realwebcare.com
 */
if ( ! defined( 'ABSPATH' ) ) exit;
add_action( 'admin_menu', 'ercs_register_menu' );
function ercs_register_menu() {
	add_menu_page('ERCS Slider', __('Elegant Slider', 'ercs' ), 'add_users', 'ercs-lists', 'ercs_plugin_menu', 'dashicons-images-alt2');
	add_submenu_page('ercs-lists', __('Slider Lists', 'ercs' ), __('All Sliders', 'ercs' ), 'add_users', 'ercs-lists', 'ercs_plugin_menu');
	add_submenu_page('ercs-lists', __('Slider Settings', 'ercs' ), __('Slider Settings', 'ercs' ), 'add_users', 'ercs-settings', 'ercs_settings_config');
}
function ercs_plugin_menu() {
	if ( !current_user_can( 'manage_options' ) )  {
		wp_die( __( 'You do not have sufficient permissions to access this page.', 'ercs' ) );
	}
	include ( plugin_dir_path( __FILE__ ) . 'ercs-process.php' );
}
function ercs_settings_config() {
	if ( !current_user_can( 'manage_options' ) )  {
		wp_die( __( 'You do not have sufficient permissions to access this page.', 'ercs' ) );
	}
	include ( plugin_dir_path( __FILE__ ) . 'ercs-settings.php' );
}
include ( ERCS_PLUGIN_PATH . 'lib/process_slider-option.php' );
if((isset($_POST['add_slider_content']) && $_POST['add_slider_content'] == "addslider") || (isset($_POST['edit_slider_content']) && $_POST['edit_slider_content'] == "editslider")) {
	if( isset( $_POST['ercs_add_content'] ) ) { ercs_add_slider_content(); }
	if( isset( $_POST['ercs_edit_content'] ) ) { ercs_edit_slider_content(); }
}
?>