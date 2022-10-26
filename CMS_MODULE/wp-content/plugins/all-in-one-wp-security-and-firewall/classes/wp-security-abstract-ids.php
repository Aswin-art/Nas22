<?php
if (!defined('ABSPATH')) {
	exit; //Exit if accessed directly
}

/**
 * All ids and static names, array.
 */
class AIOS_Abstracted_Ids {

	/**
	 * Get firewall block request methods.
	 *
	 * @return array
	 */
	public static function get_firewall_block_request_methods() {
		return array('DEBUG','MOVE', 'PUT', 'TRACK');
	}

	/**
	 * Get IP retrieve methods.
	 *
	 * @return array
	 */
	public static function get_ip_retrieve_methods() {
		// The keys are merely for maintaining backward compatibility.
		return array(
			'0' => 'REMOTE_ADDR',
			'1' => 'HTTP_CF_CONNECTING_IP',
			'2' => 'HTTP_X_FORWARDED_FOR',
			'3' => 'HTTP_X_FORWARDED',
			'4' => 'HTTP_CLIENT_IP',
			'5'	=> 'HTTP_X_REAL_IP',
			'6'	=> 'HTTP_X_CLUSTER_CLIENT_IP',
		);
	}

	/**
	 * Get AIOS custom admin notice ids.
	 *
	 * @return array
	 */
	public static function custom_admin_notice_ids() {
		return array(
			'automated-database-backup',
			'ip-retrieval-settings',
		);
	}

	/**
	 * Get notice ids for notices that have transformed HTACESS rules to PHP.
	 *
	 * @return array notice ids.
	 */
	public static function htaccess_to_php_feature_notice_ids() {
		return array(
			'login-whitelist-disabled-on-upgrade',
		);
	}
}
