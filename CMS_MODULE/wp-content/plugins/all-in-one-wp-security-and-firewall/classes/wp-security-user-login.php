<?php
if (!defined('ABSPATH')) {
	exit;//Exit if accessed directly
}

class AIOWPSecurity_User_Login {
	
	public $key_login_msg;// This will store a URI query string key for passing messages to the login form

	public function __construct() {
		global $aio_wp_security;
		$this->key_login_msg = 'aiowps_login_msg_id';
		// As a first authentication step, check if user's IP is locked.
		add_filter('authenticate', array($this, 'block_ip_if_locked'), 1, 1);
		// Check whether user needs to be manually approved after default WordPress authenticate hooks (with priority 20).
		add_filter('authenticate', array($this, 'check_manual_registration_approval'), 30, 1);
		// Check login captcha
		if ($aio_wp_security->configs->get_value('aiowps_enable_login_captcha')) {
			add_filter('authenticate', array($this, 'check_captcha'), 20, 1);
		}
		// As a last authentication step, perform post authentication steps
		add_filter('authenticate', array($this, 'post_authenticate'), 100, 3);
		add_action('aiowps_force_logout_check', array($this, 'aiowps_force_logout_action_handler'));
		add_action('clear_auth_cookie', array($this, 'wp_logout_action_handler'));
		add_filter('login_message', array($this, 'aiowps_login_message')); //WP filter to add or modify messages on the login page

		// Display disable lockdown message
		if (is_admin() && current_user_can(AIOWPSEC_MANAGEMENT_PERMISSION) && $aio_wp_security->is_login_lockdown_by_const() && $this->is_admin_page_to_display_disable_login_lockdown_by_const_notice()) {
			add_action('all_admin_notices', array($this, 'disable_login_lockdown_by_const_notice'));
		}
	}

	/**
	 * Check whether the admin page is to display disable login lockdown by const notice.
	 *
	 * @return boolean True if the notice will be displayed, Otherwise false.
	 */
	private function is_admin_page_to_display_disable_login_lockdown_by_const_notice() {
		global $pagenow;
		if (in_array($pagenow, array('index.php', 'plugins.php'))) {
			return true;
		} elseif (('admin.php' == $pagenow && isset($_GET['page']) && false !== strpos($_GET['page'], AIOWPSEC_MENU_SLUG_PREFIX)) && !$this->is_locked_ip_addresses_tab_admin_page()) {
			return true;
		}
		return false;
	}

	/**
	 * Check whether the admin page is Locked IP Addresses Tab page.
	 *
	 * @return boolean True if is Locked IP Addresses Tab page, Otherwise false.
	 */
	private function is_locked_ip_addresses_tab_admin_page() {
		global $pagenow;
		return ('admin.php' == $pagenow && isset($_GET['page']) && 'aiowpsec' == $_GET['page'] && isset($_GET['tab']) && 'tab3' == $_GET['tab']);
	}

	/**
	 * Displays admin to disable lockdown message.
	 *
	 * @return Void
	 */
	public function disable_login_lockdown_by_const_notice() {

		if (!AIOWPSecurity_Utility::has_manage_cap()) {
			return;
		}

		echo '<div class="notice notice-error">
					<p>'.
						__('You have disabled login lockdown by defining the AIOWPS_DISABLE_LOGIN_LOCKDOWN constant value as true, and the login lockdown setting has enabled it.', 'all-in-one-wp-security-and-firewall') . '&nbsp;' .
						/* translators: 1: Locked IP Addresses admin page link */
						sprintf(__('Delete your login lockdown IP from %s and define the AIOWPS_DISABLE_LOGIN_LOCKDOWN constant value as false.', 'all-in-one-wp-security-and-firewall'),
							'<a href="'.admin_url('admin.php?page=aiowpsec&tab=tab2').'">' . __('Locked IP Addresses', 'all-in-one-wp-security-and-firewall') . '</a>'
						).
					'</p>
				</div>';
	}

	/**
	 * Terminate the execution via wp_die with 503 status code, if current
	 * user's IP is currently locked.
	 *
	 * @global AIO_WP_Security $aio_wp_security
	 * @param WP_Error|WP_User $user
	 * @return WP_User
	 */
	public function block_ip_if_locked($user) {
		global $aio_wp_security;

		// Allow users to login when disable AIOWPS_DISABLE_LOCK_DOWN defined true
		if ($aio_wp_security->is_login_lockdown_by_const()) {
			return $user;
		}

		$user_locked = $this->check_locked_user();
		if (null != $user_locked) {
			$aio_wp_security->debug_logger->log_debug("Login attempt from blocked IP range - ".$user_locked['failed_login_ip'], 2);
			// Allow the error message to be filtered.
			$error_msg = apply_filters('aiowps_ip_blocked_error_msg', __('<strong>ERROR</strong>: Access from your IP address has been blocked for security reasons. Please contact the administrator.', 'all-in-one-wp-security-and-firewall'));
			// If unlock requests are allowed, add the "Request Unlock" button to the message.
			$unlock_form = '';
			if ($aio_wp_security->configs->get_value('aiowps_allow_unlock_requests') == '1') {
				$unlock_form = $this->get_unlock_request_form();
				$error_msg .= $unlock_form;
			}
			$error_msg = apply_filters('aiowps_ip_blocked_output_page', $error_msg, $unlock_form); //filter the complete output of the locked page
			wp_die($error_msg, __('Service Temporarily Unavailable', 'all-in-one-wp-security-and-firewall'), 503);
		} else {
			return $user;
		}
	}

	/**
	 * Check login captcha (if enabled).
	 *
	 * @global AIO_WP_Security $aio_wp_security
	 * @param WP_Error|WP_User $user
	 * @return WP_Error|WP_User
	 */
	public function check_captcha($user) {
		global $aio_wp_security;
		if (is_wp_error($user) || $aio_wp_security->is_login_lockdown_by_const()) {
			// Authentication has failed already at some earlier step.
			return $user;
		}

		if (! (isset($_POST['log']) && isset($_POST['pwd']))) {
			// XML-RPC authentication (not via wp-login.php), nothing to do here.
			return $user;
		}

		if ($aio_wp_security->configs->get_value('aiowps_enable_login_captcha') != '1') {
			// Captcha not enabled, nothing to do here.
			return $user;
		}
		$captcha_error = new WP_Error('authentication_failed', __('<strong>ERROR</strong>: Your answer was incorrect - please try again.', 'all-in-one-wp-security-and-firewall'));
		$verify_captcha = $aio_wp_security->captcha_obj->verify_captcha_submit();
		if (false === $verify_captcha) {
			return $captcha_error;
		}
		return $user;
	}

	/**
	 * Check, whether $user needs to be manually approved by site admin yet.
	 *
	 * @global AIO_WP_Security $aio_wp_security
	 * @param WP_Error|WP_User $user
	 * @return WP_Error|WP_User
	 */
	public function check_manual_registration_approval($user) {
		global $aio_wp_security;
		if (!($user instanceof WP_User)) {
			// Not a WP_User - nothing to do here.
			return $user;
		}
		//Check if auto pending new account status feature is enabled
		if ($aio_wp_security->configs->get_value('aiowps_enable_manual_registration_approval') == '1') {
			$aiowps_account_status = get_user_meta($user->ID, 'aiowps_account_status', true);
			if ('pending' == $aiowps_account_status) {
				// Account needs to be activated yet
				return new WP_Error('account_pending', __('<strong>ACCOUNT PENDING</strong>: Your account is currently not active. An administrator needs to activate your account before you can login.', 'all-in-one-wp-security-and-firewall'));
			}
		}
		return $user;
	}

	/**
	 * Handle post authentication steps (in case of failed login):
	 * - increment number of failed logins for $username
	 * - (optionally) lock the user
	 * - (optionally) display a generic error message
	 *
	 * @global AIO_WP_Security $aio_wp_security
	 * @param WP_Error|WP_User $user
	 * @param string           $username
	 * @param string           $password
	 * @return WP_Error|WP_User
	 */
	public function post_authenticate($user, $username, $password) {
		global $aio_wp_security;
		if (!is_wp_error($user)) {
			// Authentication has been successful, there's nothing to do here.
			return $user;
		}
		if (empty($username) || empty($password)) {
			// Neither log nor block login attempts with empty username or password.
			return $user;
		}
		if ($user->get_error_code() === 'account_pending') {
			// Neither log nor block users attempting to log in before their registration is approved.
			return $user;
		}
		// Login failed for non-trivial reason
		$this->increment_failed_logins($username);
		if ($aio_wp_security->configs->get_value('aiowps_enable_login_lockdown') == '1') {
			$is_whitelisted = false;
			//check if lockdown whitelist enabled
			if ($aio_wp_security->configs->get_value('aiowps_lockdown_enable_whitelisting') == '1') {
				$ip = AIOWPSecurity_Utility_IP::get_user_ip_address(); //Get the IP address of user
				$whitelisted_ips = $aio_wp_security->configs->get_value('aiowps_lockdown_allowed_ip_addresses');
				$is_whitelisted = AIOWPSecurity_Utility_IP::is_ip_whitelisted($ip, $whitelisted_ips);
			}

			if (false === $is_whitelisted) {
				// Too many failed logins from user's IP?
				$login_attempts_permitted = absint($aio_wp_security->configs->get_value('aiowps_max_login_attempts'));
				$too_many_failed_logins = $login_attempts_permitted <= $this->get_login_fail_count();

				// Is an invalid username or email the reason for login error?
				$invalid_username = ($user->get_error_code() === 'invalid_username' || $user->get_error_code() == 'invalid_email');
				// Should an invalid username be immediately locked?
				$invalid_username_lockdown = $aio_wp_security->configs->get_value('aiowps_enable_invalid_username_lockdown') == '1';
				$lock_invalid_username = $invalid_username && $invalid_username_lockdown;

				// Should an invalid username be blocked as per blacklist?
				$instant_lockout_users_list = $aio_wp_security->configs->get_value('aiowps_instantly_lockout_specific_usernames');
				if (!is_array($instant_lockout_users_list)) {
					$instant_lockout_users_list = array();
				}
				$username_blacklisted = $invalid_username && in_array($username, $instant_lockout_users_list);

				$lock_reasons = array();
				if ($too_many_failed_logins) {
					$lock_reasons[] = 'too_many_failed_logins';
				}
				if ($lock_invalid_username) {
					$lock_reasons[] = 'invalid_username';
				}
				if ($username_blacklisted) {
					$lock_reasons[] = 'username_blacklisted';
				}
				if ($lock_reasons) {
					$this->lock_the_user($username, implode(',', $lock_reasons));
				}
			}
		}

		if ($aio_wp_security->configs->get_value('aiowps_set_generic_login_msg') == '1') {
			// Return generic error message if configured
			return new WP_Error('authentication_failed', __('<strong>ERROR</strong>: Invalid login credentials.', 'all-in-one-wp-security-and-firewall'));
		}
		return $user;
	}
	/**
	 * This function queries the aiowps_login_lockdown table.
	 * If the release_date has not expired AND the current visitor IP addr matches
	 * it will return a record
	 */
	public function check_locked_user() {
		global $wpdb;
		$login_lockdown_table = AIOWPSEC_TBL_LOGIN_LOCKDOWN;
		$ip = AIOWPSecurity_Utility_IP::get_user_ip_address(); //Get the IP address of user
		if (empty($ip)) return false;
		$now = current_time('mysql', true);
		$locked_user = $wpdb->get_row($wpdb->prepare("SELECT * FROM $login_lockdown_table WHERE `release_date` > %s AND `failed_login_ip` = %s", $now, $ip), ARRAY_A);
		return $locked_user;
	}
	/**
	 * This function queries the aiowps_failed_logins table and returns the number of failures for current IP range within allowed failure period
	 */
	public function get_login_fail_count() {

		global $wpdb, $aio_wp_security;
		
		$failed_logins_table = AIOWPSEC_TBL_FAILED_LOGINS;
		$login_retry_interval = $aio_wp_security->configs->get_value('aiowps_retry_time_period');
		$now = current_time('mysql', true);
		$ip = AIOWPSecurity_Utility_IP::get_user_ip_address(); //Get the IP address of user

		if (empty($ip)) return false;

		$login_failures = $wpdb->get_var("SELECT COUNT(ID) FROM $failed_logins_table " . "WHERE failed_login_date + INTERVAL " . esc_sql($login_retry_interval) . " MINUTE > '" . esc_sql($now) . "' AND " . "login_attempt_ip = '" . esc_sql($ip) . "'");
		return $login_failures;
	}

	/**
	 * Get lockout time dynamically multiplied with default lockout time
	 *
	 * @return Integer get lockout time length.
	 */
	private function get_dynamic_lockout_time_length() {
		global $aio_wp_security;

		$login_fail_count = $this->get_login_fail_count();
		$lockout_time_default = $aio_wp_security->configs->get_value('aiowps_lockout_time_length');
		if (!is_numeric($lockout_time_default)) {
			$lockout_time_default = 5;
		}
		$lockout_time_max = $aio_wp_security->configs->get_value('aiowps_max_lockout_time_length');
		if (!is_numeric($lockout_time_max)) {
			$lockout_time_max = 60;
		}
		$lockout_time_length = (int) ($login_fail_count > 0 ? (3 * $lockout_time_default * ($login_fail_count + 1)) : $lockout_time_default);

		return $lockout_time_length >= $lockout_time_max ? $lockout_time_max : $lockout_time_length;
	}

	/**
	 * Adds an entry to the `aiowps_login_lockdown` table.
	 *
	 * @param string $username              User's username or email
	 * @param string $lock_reason
	 * @param bool   $is_lockout_email_sent flag for lockout email send
	 */
	public function lock_the_user($username, $lock_reason = 'login_fail', $is_lockout_email_sent = 0) {
		global $wpdb, $aio_wp_security;
		$login_lockdown_table = AIOWPSEC_TBL_LOGIN_LOCKDOWN;
		$lock_minutes = $this->get_dynamic_lockout_time_length();
		$ip = AIOWPSecurity_Utility_IP::get_user_ip_address(); //Get the IP address of user
		if (empty($ip)) return;
		$ip_range = AIOWPSecurity_Utility_IP::get_sanitized_ip_range($ip); //Get the IP range of the current user
		$user = is_email($username) ? get_user_by('email', $username) : get_user_by('login', $username); //Returns WP_User object if exists
		$ip_range = apply_filters('aiowps_before_lockdown', $ip_range);
		if ($user) {
			//If the login attempt was made using a valid user set variables for DB storage later on
			$user_id = $user->ID;
		} else {
			//If the login attempt was made using a non-existent user then let's set user_id to blank and record the attempted user login name for DB storage later on
			$user_id = 0;
		}
		$ip_range_str = esc_sql($ip_range).'.*';// phpcs:ignore VariableAnalysis.CodeAnalysis.VariableAnalysis.UnusedVariable

		$lock_time = current_time('mysql', true);
		$date = new DateTime($lock_time);
		$add_interval = 'PT'.absint($lock_minutes).'M';
		$date->add(new DateInterval($add_interval));
		$release_time = $date->format('Y-m-d H:i:s');
		$backtrace_log = '';
		if ('1' == $aio_wp_security->configs->get_value('aiowps_enable_php_backtrace_in_email')) {
			$backtrace_log = print_r(debug_backtrace(), true);
		}
		$is_lockout_email_sent = (1 == $aio_wp_security->configs->get_value('aiowps_enable_email_notify') ? 0 : -1);
		$data = array('user_id' => $user_id, 'user_login' => $username, 'lockdown_date' => $lock_time, 'release_date' => $release_time, 'failed_login_IP' => $ip, 'lock_reason' => $lock_reason, 'is_lockout_email_sent' => $is_lockout_email_sent, 'backtrace_log' => $backtrace_log);
		$format = array('%d', '%s', '%s', '%s', '%s', '%s', '%d', '%s');
		$result = $wpdb->insert($login_lockdown_table, $data, $format);

		if (false === $result) {
			$aio_wp_security->debug_logger->log_debug("Error inserting record into ".$login_lockdown_table, 4);//Log the highly unlikely event of DB error
		} else {
			do_action('aiowps_lockdown_event', $ip_range, $username);
			$aio_wp_security->debug_logger->log_debug("The following IP address range has been locked out for exceeding the maximum login attempts: ".$ip_range, 2);//Log the lockdown event
		}
	}
	/**
	 * Adds an entry to the `aiowps_failed_logins` table.
	 *
	 * @param string $username User's username or email
	 */
	public function increment_failed_logins($username) {
		global $wpdb, $aio_wp_security;
		$login_fails_table = AIOWPSEC_TBL_FAILED_LOGINS;
		$ip = AIOWPSecurity_Utility_IP::get_user_ip_address(); //Get the IP address of user
		if (empty($ip)) return;
		$user = is_email($username) ? get_user_by('email', $username) : get_user_by('login', $username); //Returns WP_User object if it exists
		if ($user) {
			//If the login attempt was made using a valid user set variables for DB storage later on
			$user_id = $user->ID;
		} else {
			//If the login attempt was made using a non-existent user then let's set user_id to blank and record the attempted user login name for DB storage later on
			$user_id = 0;
		}
		$ip_str = esc_sql($ip);
		$now = current_time('mysql', true);
		$data = array('user_id' => $user_id, 'user_login' => $username, 'failed_login_date' => $now, 'login_attempt_ip' => $ip_str);
		$format = array('%d', '%s', '%s', '%s');
		$result = $wpdb->insert($login_fails_table, $data, $format);
		if (false === $result) {
			$aio_wp_security->debug_logger->log_debug("Error inserting record into ".$login_fails_table, 4);//Log the highly unlikely event of DB error
		}
	}

	/**
	 * Send IP Lock notification.
	 *
	 * @param Array  $lockout_ips_list   have username, ip_range, ip
	 * @param String $backtrace_filepath
	 *
	 * @return Boolean True if mail sent otherwise false.
	 */
	private function send_ip_lock_notification_email($lockout_ips_list = array(), $backtrace_filepath = '') {
		global $aio_wp_security;
		$send_mail = false;
		if (0 != count($lockout_ips_list)) {
			$email_notification_enabled = $aio_wp_security->configs->get_value('aiowps_enable_email_notify');
			if (1 == $email_notification_enabled) {
				$to_email_address = AIOWPSecurity_Utility::get_array_from_textarea_val($aio_wp_security->configs->get_value('aiowps_email_address'));
				if (empty($to_email_address)) {
					$to_email_address = array(get_site_option('admin_email'));
				}
				$subject = '['.get_option('home').'] '. __('Site Lockout Notification', 'all-in-one-wp-security-and-firewall');
				$email_msg = __('Lockdown events had occurred due to too many failed login attempts or invalid username:', 'all-in-one-wp-security-and-firewall')."\n\n";
			
				foreach ($lockout_ips_list as $lockout_ip) {
					$email_msg .= __('Username:', 'all-in-one-wp-security-and-firewall') . ' ' . $lockout_ip['username'] . "\n";
					$email_msg .= __('IP Address:', 'all-in-one-wp-security-and-firewall') . ' ' . $lockout_ip['ip'] . "\n";
					if ('' != $lockout_ip['ip_range']) {
						$email_msg .= __('IP Range:', 'all-in-one-wp-security-and-firewall') . ' ' . $lockout_ip['ip_range'] . '.*' . "\n";
					}
					$email_msg .= "\n";
				}
			
				$email_msg .= __("Log into your site WordPress administration panel to see the duration of the lockout or to unlock the user.", 'all-in-one-wp-security-and-firewall') . "\n";
			
				$site_title = get_bloginfo('name');
				$from_name = empty($site_title) ? 'WordPress' : $site_title;
				$email_header = 'From: '.$from_name.' <'.get_bloginfo('admin_email').'>' . "\r\n\\";
				$send_mail = wp_mail($to_email_address, $subject, $email_msg, $email_header, $backtrace_filepath);
			
				if (false === $send_mail) {
					$ips_list = implode(', ', wp_list_pluck($lockout_ips_list, 'ip'));
					$aio_wp_security->debug_logger->log_debug("Lockout notification email failed to send to " . implode(', ', $to_email_address) . " for IPs ".$ips_list, 4);
				}
			}
		}
		return $send_mail;
	}

	/**
	 * Generates and returns an unlock request link which will be used to send to the user.
	 *
	 * @global type $wpdb
	 * @global AIO_WP_Security $aio_wp_security
	 * @param type $ip_range
	 * @return string or false on failure
	 */
	public static function generate_unlock_request_link($ip_range) {
		//Get the locked user row from lockdown table
		global $wpdb, $aio_wp_security;
		$unlock_link = '';
		$lockdown_table_name = AIOWPSEC_TBL_LOGIN_LOCKDOWN;
		$secret_rand_key = (md5(uniqid(rand(), true)));
		$unlock_request_date_time = current_time('mysql', true);
		$res = $wpdb->query($wpdb->prepare("UPDATE $lockdown_table_name SET unlock_key = %s WHERE release_date > %s AND failed_login_ip LIKE %s", $secret_rand_key, $unlock_request_date_time, "%" . esc_sql($ip_range) . "%"));
		if (null == $res) {
			$aio_wp_security->debug_logger->log_debug("No locked user found with IP range ".$ip_range, 4);
			return false;
		} else {
			//Check if unlock request or submitted from a woocommerce account login page
			if (isset($_POST['aiowps-woo-login'])) {
				$date_time = current_time('mysql');
				$data = array('date_time' => $date_time, 'meta_key1' => 'woo_unlock_request_key', 'meta_value1' => $secret_rand_key);
				$result = $wpdb->insert(AIOWPSEC_TBL_GLOBAL_META_DATA, $data);
				if (false === $result) {
					$aio_wp_security->debug_logger->log_debug("generate_unlock_request_link() - Error inserting woo_unlock_request_key to AIOWPSEC_TBL_GLOBAL_META_DATA table for secret key ".$secret_rand_key, 4);
				}
			}
			$query_param = array('aiowps_auth_key' => $secret_rand_key);
			$wp_site_url = AIOWPSEC_WP_URL;
			$unlock_link = esc_url(add_query_arg($query_param, $wp_site_url));
		}
		return $unlock_link;
	}

	/**
	 * This function will process an unlock request when someone clicks on the special URL
	 * It will check if the special random code matches that in lockdown table for the relevant user
	 * If so, it will unlock the user
	 *
	 * @param string $unlock_key
	 * @return void
	 */
	public static function process_unlock_request($unlock_key) {
		global $wpdb, $aio_wp_security;
		$lockdown_table_name = AIOWPSEC_TBL_LOGIN_LOCKDOWN;
		$unlock_request_date_time = current_time('mysql', true);
		$unlock_command = $wpdb->prepare("UPDATE ".$lockdown_table_name." SET release_date = %s WHERE unlock_key = %s", $unlock_request_date_time, $unlock_key);
		$result = $wpdb->query($unlock_command);
		if (false === $result) {
			$aio_wp_security->debug_logger->log_debug("Error unlocking user with unlock_key ".$unlock_key, 4);
		} else {
			//Now check if this unlock operation is for a woocommerce login
			$aiowps_global_meta_tbl_name = AIOWPSEC_TBL_GLOBAL_META_DATA;
			$sql = $wpdb->prepare("SELECT * FROM $aiowps_global_meta_tbl_name WHERE meta_key1=%s AND meta_value1=%s", 'woo_unlock_request_key', $unlock_key);
			$woo_result = $wpdb->get_row($sql, OBJECT);
			if (empty($woo_result)) {
				$woo_unlock = false;
			} else {
				$woo_unlock = true;
			}
			if ($aio_wp_security->configs->get_value('aiowps_enable_rename_login_page')=='1') {
				if (get_option('permalink_structure')) {
					$home_url = trailingslashit(home_url());
				} else {
					$home_url = trailingslashit(home_url()) . '?';
				}
				if ($woo_unlock) {
					$login_url = wc_get_page_permalink('myaccount'); //redirect to woo login page if applicable
					//Now let's cleanup after ourselves and delete the woo-related row in the AIOWPSEC_TBL_GLOBAL_META_DATA table
					$delete = $wpdb->delete($aiowps_global_meta_tbl_name, array('meta_key1' => 'woo_unlock_request_key', 'meta_value1' => $unlock_key));
					if (false === $delete) {
						$aio_wp_security->debug_logger->log_debug("process_unlock_request(): Error deleting row from AIOWPSEC_TBL_GLOBAL_META_DATA for meta_key1=woo_unlock_request_key and meta_value1=".$unlock_key, 4);
					}
				} else {
					$login_url = $home_url.$aio_wp_security->configs->get_value('aiowps_login_page_slug');
				}

				AIOWPSecurity_Utility::redirect_to_url($login_url);
			} else {
				AIOWPSecurity_Utility::redirect_to_url(wp_login_url());
			}
		}
	}

	/**
	 * This function sends an unlock request email to a locked out user
	 *
	 * @param string $email
	 * @param string $unlock_link
	 * @return void
	 */
	public static function send_unlock_request_email($email, $unlock_link) {
		global $aio_wp_security;
		$subject = '['.get_option('siteurl').'] '. __('Unlock Request Notification', 'all-in-one-wp-security-and-firewall');
		$email_msg = sprintf(__('You have requested for the account with email address %s to be unlocked. Please click the link below to unlock your account:', 'all-in-one-wp-security-and-firewall'), $email) . "\n" . sprintf(__('Unlock link: %s', 'all-in-one-wp-security-and-firewall'), $unlock_link) . "\n\n" . __('After clicking the above link you will be able to login to the WordPress administration panel.', 'all-in-one-wp-security-and-firewall') . "\n";
		$site_title = get_bloginfo('name');
		$from_name = empty($site_title) ? 'WordPress' : $site_title;
		$email_header = 'From: '.$from_name.' <'.get_bloginfo('admin_email').'>' . "\r\n\\";
		$sendMail = wp_mail($email, $subject, $email_msg, $email_header);
		if (false === $sendMail) {
			$aio_wp_security->debug_logger->log_debug("Unlock Request Notification email failed to send to " . $email, 4);
		}
	}

	/**
	 * Check the settings and log the user after the configured time period
	 *
	 * @return void
	 */
	public function aiowps_force_logout_action_handler() {
		global $aio_wp_security;
		//$aio_wp_security->debug_logger->log_debug("Force Logout - Checking if any user need to be logged out...");
		//if this feature is enabled then do something
		if ($aio_wp_security->configs->get_value('aiowps_enable_forced_logout')=='1') {
			if (is_user_logged_in()) {
				$current_user = wp_get_current_user();
				$user_id = $current_user->ID;
				$current_time = current_time('mysql', true);
				$login_time = $this->get_wp_user_aiowps_last_login_time($user_id);
				if (empty($login_time)) {
					return;
				}
				$diff = strtotime($current_time) - strtotime($login_time);
				$logout_time_interval_value = $aio_wp_security->configs->get_value('aiowps_logout_time_period');
				$logout_time_interval_val_seconds = $logout_time_interval_value * 60;
				if ($diff > $logout_time_interval_val_seconds) {
					$aio_wp_security->debug_logger->log_debug("Force Logout - This user logged in more than (".$logout_time_interval_value.") minutes ago. Doing a force log out for the user with username: ".$current_user->user_login);
					$this->wp_logout_action_handler(); //this will register the logout time/date in the logout_date column

					$curr_page_url = AIOWPSecurity_Utility::get_current_page_url();
					$after_logout_payload = array('redirect_to' => $curr_page_url, 'msg' => $this->key_login_msg.'=session_expired');
					//Save some of the logout redirect data to a transient
					is_multisite() ? set_site_transient('aiowps_logout_payload', $after_logout_payload, 30 * 60) : set_transient('aiowps_logout_payload', $after_logout_payload, 30 * 60);
					$logout_url = AIOWPSEC_WP_URL.'?aiowpsec_do_log_out=1';
					$logout_url = AIOWPSecurity_Utility::add_query_data_to_url($logout_url, 'al_additional_data', '1');
					$logout_url_with_nonce = html_entity_decode(wp_nonce_url($logout_url, 'aio_logout'));
					AIOWPSecurity_Utility::redirect_to_url($logout_url_with_nonce);
				}
			}
		}
	}

	/**
	 * Get last logged in time of given user id.
	 *
	 * @param integer $user_id
	 * @return mixed Last login time. False for an invalid $user_id (non-numeric, zero, or negative value). An empty string if a valid but non-existing user ID is passed.
	 */
	public function get_wp_user_aiowps_last_login_time($user_id) {
		$last_login = apply_filters('aiowps_get_last_login_time', get_user_meta($user_id, 'aiowps_last_login_time', true), $user_id);
		return $last_login;
	}

	public static function wp_login_action_handler($user_login, $user = '') {
		global $wpdb, $aio_wp_security;
		$login_activity_table = AIOWPSEC_TBL_USER_LOGIN_ACTIVITY;

		if ('' == $user) {
			//Try and get user object
			$user = get_user_by('login', $user_login); //This should return WP_User obj
			if (!$user) {
				$aio_wp_security->debug_logger->log_debug("AIOWPSecurity_User_Login::wp_login_action_handler: Unable to get WP_User object for login ".$user_login, 4);
				return;
			}
		}
		$login_date_time = current_time('mysql', true);
		update_user_meta($user->ID, 'aiowps_last_login_time', $login_date_time); //store last login time in meta table
		$curr_ip_address = AIOWPSecurity_Utility_IP::get_user_ip_address();
		$data = array('user_id' => $user->ID, 'user_login' => $user_login, 'login_date' => $login_date_time, 'login_ip' => $curr_ip_address);
		$format = array('%d', '%s', '%s', '%s');
		$result = $wpdb->insert($login_activity_table, $data, $format);
		if (false === $result) {
			$aio_wp_security->debug_logger->log_debug("Error inserting record into ".$login_activity_table, 4);//Log the highly unlikely event of DB error
		}

	}
	/**
	 * The handler for logout events, ie, uses the WP "clear_auth_cookies" action.
	 * Modifies the login activity record for the current user by registering the logout time/date in the logout_date column.
	 * (NOTE: Because of the way we are doing a force logout, the "clear_auth_cookies" hook does not fire.
	 * upon auto logout. The current workaround is to call this function directly from the aiowps_force_logout_action_handler() when
	 * an auto logout occurs due to the "force logout" feature).
	 */
	public function wp_logout_action_handler() {
		global $wpdb, $aio_wp_security;
		$current_user = wp_get_current_user();
		$ip_addr = AIOWPSecurity_Utility_IP::get_user_ip_address();
		$user_id = $current_user->ID;
		//Clean up transients table
		$this->cleanup_users_online_transient($user_id, $ip_addr);
		$login_activity_table = AIOWPSEC_TBL_USER_LOGIN_ACTIVITY;
		$logout_date_time = current_time('mysql', true);
		$data = array('logout_date' => $logout_date_time);
		$where = array('user_id' => $user_id, 'login_ip' => $ip_addr, 'logout_date' => '1000-10-10 10:00:00');
		$result = $wpdb->update($login_activity_table, $data, $where);
		if (false === $result) {
			$aio_wp_security->debug_logger->log_debug("Error inserting record into ".$login_activity_table, 4);//Log the highly unlikely event of DB error
		}
	}

	/**
	 * Update the 'users_online' transient
	 *
	 * @return void
	 */
	public function update_users_online_transient() {
		if (is_user_logged_in()) {
			$is_multi_site = is_multisite();
			$current_user_ip = AIOWPSecurity_Utility_IP::get_user_ip_address();
			// get the logged in users list from transients entry
			$logged_in_users = ($is_multi_site ? get_site_transient('users_online') : get_transient('users_online'));
			$current_user = wp_get_current_user();
			$current_user = $current_user->ID;
			$current_time = current_time('timestamp');
			$current_user_info = array();

			// Store last activity time and ip address in transient entry
			if ($is_multi_site) {
				$current_blog_id = get_current_blog_id();
				// For multi-sites also store blog_id
				$current_user_info = array("user_id" => $current_user, "last_activity" => $current_time, "ip_address" => $current_user_ip, "blog_id" => $current_blog_id);
			} else {
				$current_user_info = array("user_id" => $current_user, "last_activity" => $current_time, "ip_address" => $current_user_ip, "blog_id" => false);
			}

			if (empty($logged_in_users)) {
				// case when "users_online" transient has been deleted after expiry or is empty
				$logged_in_users = array();
				$logged_in_users[] = $current_user_info;
				$is_multi_site ? set_site_transient('users_online', $logged_in_users, 30 * 60) : set_transient('users_online', $logged_in_users, 30 * 60);
			} else {
				$key = 0;
				$update_existing = false;
				$item_index = 0;
				foreach ($logged_in_users as $value) {
					$value_minus_activity = $value;
					unset($value_minus_activity['last_activity']);
					$current_user_minus_activity = $current_user_info;
					unset($current_user_minus_activity['last_activity']);
					// Check if current user we're looking at has an entry in the 'users_online' transient
					if (empty(array_diff($current_user_minus_activity, $value_minus_activity))) {
						if ($value['last_activity'] < ($current_time - (15 * 60))) {
							$update_existing = true;
							$item_index = $key;
							break;
						} else {
							return; // do nothing and just return
						}
					}
					$key++;
				}

				if ($update_existing) {
					// Update transient if the last activity was over 15 min ago for this user
					$logged_in_users[$item_index] = $current_user_info;
					is_multisite() ? set_site_transient('users_online', $logged_in_users, 30 * 60) : set_transient('users_online', $logged_in_users, 30 * 60);
				} else {
					$logged_in_users[] = $current_user_info;
					is_multisite() ? set_site_transient('users_online', $logged_in_users, 30 * 60) : set_transient('users_online', $logged_in_users, 30 * 60);
				}
			}
		}
	}

	/**
	 * This will clean up the "users_online" transient entry for the current user when a logout occurs
	 *
	 * @param int $user_id
	 * @param int $ip_addr
	 * @return void
	 */
	public function cleanup_users_online_transient($user_id, $ip_addr) {
		$is_multi_site = is_multisite();
		if ($is_multi_site) {
			$current_blog_id = get_current_blog_id();
			$logged_in_users = AIOWPSecurity_User_Login::get_subsite_logged_in_users($current_blog_id);
		} else {
			$logged_in_users = get_transient('users_online');
		}

		if (empty($logged_in_users)) {
			return;
		}
		$j = 0;
		foreach ($logged_in_users as $value) {
			if ($value['user_id'] == $user_id && strcmp($value['ip_address'], $ip_addr) == 0) {
				unset($logged_in_users[$j]);
				break;
			}
			$j++;
		}

		// Save the transient
		if ($is_multi_site) {
			set_site_transient('users_online', $logged_in_users, 30 * 60);
		} else {
			set_transient('users_online', $logged_in_users, 30 * 60);
		}
		return;
	}

	/**
	 * The handler for the WP "login_message" filter
	 * Adds custom messages to the other messages that appear above the login form.
	 *
	 * NOTE: This method is automatically called by WordPress for displaying
	 * text above the login form.
	 *
	 * @param string $message the output from earlier login_message filters
	 * @return string
	 */
	public function aiowps_login_message($message = '') {
		global $aio_wp_security;
		$msg = '';
		if (isset($_GET[$this->key_login_msg]) && !empty($_GET[$this->key_login_msg])) {
			$logout_msg = strip_tags($_GET[$this->key_login_msg]);
		}
		if (!empty($logout_msg)) {
			switch ($logout_msg) {
				case 'session_expired':
					$msg = sprintf(__('Your session has expired because it has been over %d minutes since your last login.', 'all-in-one-wp-security-and-firewall'), $aio_wp_security->configs->get_value('aiowps_logout_time_period'));
					$msg .= ' ' . __('Please log back in to continue.', 'all-in-one-wp-security-and-firewall');
					break;
				case 'admin_user_changed':
					$msg = __('You were logged out because you just changed the "admin" username.', 'all-in-one-wp-security-and-firewall');
					$msg .= ' ' . __('Please log back in to continue.', 'all-in-one-wp-security-and-firewall');
					break;
				default:
			}
		}
		if (!empty($msg)) {
			$msg = htmlspecialchars($msg, ENT_QUOTES, 'UTF-8');
			$message .= '<p class="login message">'. $msg . '</p>';
		}
		return $message;
	}
	/**
	 * This function will generate an unlock request form to be inserted inside
	 * error message when user gets locked out.
	 *
	 * @return string
	 */
	public function get_unlock_request_form() {
		global $aio_wp_security;
		$unlock_request_form = '';
		//Let's encode some hidden data and make a form
		$unlock_secret_string = $aio_wp_security->configs->get_value('aiowps_unlock_request_secret_key');
		$current_time = time();
		$enc_result = base64_encode($current_time.$unlock_secret_string);
		$unlock_request_form .= '<form method="post" action=""><div style="padding-bottom:10px;"><input type="hidden" name="aiowps-unlock-string-info" id="aiowps-unlock-string-info" value="'.$enc_result.'" />';
		$unlock_request_form .= '<input type="hidden" name="aiowps-unlock-temp-string" id="aiowps-unlock-temp-string" value="'.$current_time.'" />';
		if (isset($_POST['woocommerce-login-nonce'])) {
			$unlock_request_form .= '<input type="hidden" name="aiowps-woo-login" id="aiowps-woo-login" value="1" />';
		}
		$unlock_request_form .= '<button type="submit" name="aiowps_unlock_request" id="aiowps_unlock_request" class="button">'.__('Request Unlock', 'all-in-one-wp-security-and-firewall').'</button></div></form>';
		return $unlock_request_form;
	}

	/**
	 * Returns all logged in users for specific subsite of multisite installation
	 * Checks the aiowps transient 'users_online'
	 *
	 * @param type $blog_id
	 * @return array|bool
	 */
	public static function get_subsite_logged_in_users($blog_id = 0) {
		if (empty($blog_id)) return false;

		$subsite_logged_in_users = array();
		if (is_multisite()) {
			// this contains all logged in users sitewide across subsites
			$users_online = get_site_transient('users_online');
			if (empty($users_online)) {
				return array();
			}
			// Extract only logged in users for current subsite
			foreach ($users_online as $user) {
				if (isset($user['blog_id']) && $user['blog_id'] == $blog_id) {
					$subsite_logged_in_users[] = $user;
				}
			}
		}
		return $subsite_logged_in_users;
	}

	/**
	 * Send email notification to an user that has flag is_lockout_email_sent is 0.
	 *
	 * @return Void
	 */
	public function send_login_lockout_emails() {
		global $wpdb, $aio_wp_security;
		// if user enabled notification email then only have to send
		$email_notification_enabled = $aio_wp_security->configs->get_value('aiowps_enable_email_notify');
		if (0 == $email_notification_enabled) {
			return;
		}
		// get recent lockout records on top to notify
		$sql = $wpdb->prepare('SELECT id, user_login, failed_login_ip, backtrace_log FROM ' .AIOWPSEC_TBL_LOGIN_LOCKDOWN. ' WHERE is_lockout_email_sent = %d ORDER BY id DESC', 0);
		$result = $wpdb->get_results($sql);
		if (empty($result)) {
			return;
		}
		$login_lockout_ids_send_emails = array();
		$lockout_ips_backtrace_log = array();
		$lockout_ips_list = array();
		$backtrace_filepath = '';
		foreach ($result as $row) {
			$ip_range = AIOWPSecurity_Utility_IP::get_sanitized_ip_range($row->failed_login_ip);
			$lockout_ips_list[] = array('username' => $row->user_login, 'ip' => $row->failed_login_ip, 'ip_range' => $ip_range);
			$login_lockout_ids_send_emails[] = $row->id;
			if ('1' == $aio_wp_security->configs->get_value('aiowps_enable_php_backtrace_in_email') && '' != $row->backtrace_log) {
				$lockout_ips_backtrace_log[] = array('backtrace_log' => $row->backtrace_log);
			}
		}
		
		if (0 != count($lockout_ips_backtrace_log)) {
			$backtrace_filepath = AIOWPSecurity_Utility::login_lockdown_email_backtrace_log_file($lockout_ips_backtrace_log);
		}
		
		$this->send_ip_lock_notification_email($lockout_ips_list, $backtrace_filepath);
		
		if ('' != $backtrace_filepath) {
			unlink($backtrace_filepath);
		}
		
		if (!empty($login_lockout_ids_send_emails)) {
			$aio_wp_security->debug_logger->log_debug(sprintf('The IP lock notification emails of login lockout ids [%s] are sent.', implode(', ', $login_lockout_ids_send_emails)), 4);
			// update all email to as sent.
			$sql = $wpdb->prepare('UPDATE '.AIOWPSEC_TBL_LOGIN_LOCKDOWN.' SET is_lockout_email_sent = %d WHERE is_lockout_email_sent = %d', 1, 0);
			//$sql = $wpdb->prepare('UPDATE '.AIOWPSEC_TBL_LOGIN_LOCKDOWN.' SET is_lockout_email_sent = %d WHERE id IN (%1s)', 1, implode(', ', $login_lockout_ids_send_emails));
			$update_result = $wpdb->query($sql);
			if (false === $update_result) {
				$error_msg = empty($wpdb->last_error) ? 'Could not receive the reason for the failure' : $wpdb->last_error;
				$aio_wp_security->debug_logger->log_debug_cron("Lockout email flag is not updated in database due to error: {$error_msg}", 4);
			}
		}
	}
}
