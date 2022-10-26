<?php
/*
 * Elegant Responsive Content Slider 1.0.1
 * By @realwebcare - http://www.realwebcare.com
 */
if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly 
function ercs_sidebar() { ?>
	<div id="ercs-sidebar" class="postbox-container">
		<div id="ercsusage-shortcode" class="ercsusage-sidebar">
			<h3><?php _e('Plugin Shortcode', 'ercs'); ?></h3>
			<div class="ercsshortcode"><input type="text" class="ercs-shortcode" value="[elegant-slider]" /></div>
		</div>
		<div id="ercsusage-info" class="ercsusage-sidebar">
			<h3><?php _e('Plugin Info', 'ercs'); ?></h3>
			<ul class="ercsusage-list">
				<li><?php _e('Version: 1.0.2', 'ercs'); ?></li>
				<li><?php _e('Requires: Wordpress 3.5+', 'ercs'); ?></li>
				<li><?php _e('First release: 25 May, 2017', 'ercs'); ?></li>
				<li><?php _e('Last Update: 14 June, 2020', 'ercs'); ?></li>
                <li><?php _e('By', 'ercs'); ?>: <a href="https://www.realwebcare.com/" target="_blank"><?php _e('Realwebcare', 'ercs'); ?></a><br/>
                <li><?php _e('Need Help', 'ercs'); ?>? <a href="https://wordpress.org/support/plugin/elegant-responsive-content-slider/" target="_blank">Support</a><br/>
                <li><?php _e('Like it? Please leave us a', 'ercs'); ?> <a target="_blank" href="https://wordpress.org/support/plugin/elegant-responsive-content-slider/reviews/?filter=5/#new-post">&#9733;&#9733;&#9733;&#9733;&#9733;</a> <?php _e('rating. We highly appreciate your support!', 'ercs'); ?><br/>
                <li><?php _e('Published under', 'ercs'); ?>: <a href="http://www.gnu.org/licenses/gpl.txt"><?php _e('GNU General Public License', 'ercs'); ?></a>
				<li><?php _e('Facebook', 'ercs'); ?>: <a href="https://www.facebook.com/realwebcare" target="_blank"><?php _e('Realwebcare', 'ercs'); ?></a></li>
			</ul>
		</div>
	</div><?php
}
add_action( 'ercs_settings_content', 'ercs_sidebar' );
?>