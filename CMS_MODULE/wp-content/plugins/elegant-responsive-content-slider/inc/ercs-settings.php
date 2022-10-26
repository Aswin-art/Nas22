<?php
/*
 * Elegant Responsive Content Slider 1.0.2
 * By @realwebcare - https://www.realwebcare.com
 */
if ( ! defined( 'ABSPATH' ) ) exit;
$elegant_slider = 'elegant_slider';
$elegant_slider_name = ucwords(str_replace('_', ' ', $elegant_slider));
$slider_options = get_option($elegant_slider.'_options');
if( !$slider_options ) {
	$checkValue = 'add';
	$slider_option_items = array( 'enable' => 'yes', 'fscrn' => '', 'rtitle' => 'Featured', 'excln' => '30', 'sctent' => 'true', 'stitle' => 'true', 'sdesc' => 'true', 'asdes' => 'ASC', 'sparam' => 'date', 'cwidth' => '', 'iwidth' => '250px', 'iheight' => '250px', 'dwidth' => '50', 'mxhgt' => '500px', 'tfsize' => '', 'mfsize' => '', 'dfsize' => '', 'bfsize' => '', 'rfsize' => '', 'scolor' => '#ffffff', 'siclr' => '#333333', 'sbclr' => '#f1f1f1', 'srbclr' => '#002B3B', 'sbtclr' => '#000000', 'sbhvr' => '#dddddd', 'sbbrd' => '#dddddd', 'stbclr' => '#000000', 'sdbclr' => '#000000', 'srclr' => '#ffffff', 'slclr' => '#2980B9', 'slhvr' => '#333333', 'scclr' => '#000000', 'rmclr' => '#f1f1f1', 'rmhvr' => '#000000', 'trdur' => '500', 'spager' => 'false', 'sctrl' => 'false', 'autotr' => 'true', 'trtime' => '4000', 'dyhgt' => 'true' );
	foreach($slider_option_items as $key => $item) {
		$slider_options[$key] = $item;
	}
} else {
	if( !isset($slider_options['fscrn']) ) { $slider_options['fscrn'] = ''; }
	if( !isset($slider_options['mxhgt']) ) { $slider_options['mxhgt'] = ''; }
	if( !isset($slider_options['stbclr']) ) { $slider_options['stbclr'] = '#000000'; }
	if( !isset($slider_options['sdbclr']) ) { $slider_options['sdbclr'] = '#000000'; }
	if( !isset($slider_options['dwidth']) ) { $slider_options['dwidth'] = '50'; }
	$checkValue = 'update';
} ?>
<div class="wrap">
	<div id="add_new_slider" class="postbox-container">
		<h2 class="slider-header"><?php _e('Elegant Slider Options', 'ercs'); ?></h2>
		<form id='ercs_process_options' method="post" action="" enctype="multipart/form-data">
			<input type="hidden" name="ercs_options" value="processoptions">
			<div id="settingsliderdiv">
				<div id="tabs">
					<ul>
						<li><a href="#general"><?php _e('General Settings', 'ercs'); ?></a></li>
						<li><a href="#structure"><?php _e('Structure Settings', 'ercs'); ?></a></li>
						<li><a href="#font"><?php _e('Font Settings', 'ercs'); ?></a></li>
						<li><a href="#color"><?php _e('Color Settings', 'ercs'); ?></a></li>
						<li><a href="#advance"><?php _e('Advanced Settings', 'ercs'); ?></a></li>
					</ul>
			
					<div id="general" class="advance-input">
						<label class="input-check"><?php _e('Enable ', 'ercs'); ?><?php echo $elegant_slider_name; ?>:</label>
						<input type="checkbox" name="ercs_option" class="tickbox" id="ercs_option" value="yes"<?php if($slider_options['enable'] == 'yes') { ?> checked="checked" <?php } ?>>
						<label class="input-check"><?php _e('Enable Full Screen', 'ercs'); ?>:</label>
						<input type="checkbox" name="full_screen" class="tickbox" id="full_screen" value="yes"<?php if($slider_options['fscrn'] == 'yes') { ?> checked="checked" <?php } ?>>
						<div id="dis_full_screen">
							<label class="input-title"><?php _e('Slider Ribbon Title', 'ercs'); ?></label>
							<input type="text" name="ribbon_title" class="medium" id="ribbon_title" value="<?php echo $slider_options['rtitle']; ?>" placeholder="e.g. Featured">
							<label class="input-title"><?php _e('Enter Excerpt Length', 'ercs'); ?><a href="#" class="ercs_tooltip" rel="<?php _e('Number of words to show for slider description.', 'ercs'); ?>"></a></label>
							<input type="number" name="excerpt_length" class="medium" id="excerpt_length" value="<?php echo $slider_options['excln']; ?>" min="10" max="1000" placeholder="e.g. 30">
						</div>
						<div id="slider_full_screen">
							<label class="input-title"><?php _e('Display Slider Content', 'ercs'); ?>:</label>
							<select name="slider_content" id="slider_content" class="slider-dir">
								<?php if($slider_options['sctent'] == 'true') { ?>
								<option value="true" id="content_on" selected="selected"><?php _e('Yes', 'ercs'); ?></option>
								<option value="false" id="content_off"><?php _e('No', 'ercs'); ?></option>
								<?php } else { ?>
								<option value="true" id="content_on"><?php _e('Yes', 'ercs'); ?></option>
								<option value="false" id="content_off" selected="selected"><?php _e('No', 'ercs'); ?></option>
								<?php } ?>
							</select>
							<div id="slider_content_setup">
								<label class="input-title"><?php _e('Display Slider Title', 'ercs'); ?>:</label>
								<select name="slider_title" id="slider_title" class="slider-dir">
									<?php if($slider_options['stitle'] == 'true') { ?>
									<option value="true" selected="selected"><?php _e('Yes', 'ercs'); ?></option>
									<option value="false"><?php _e('No', 'ercs'); ?></option>
									<?php } else { ?>
									<option value="true"><?php _e('Yes', 'ercs'); ?></option>
									<option value="false" selected="selected"><?php _e('No', 'ercs'); ?></option>
									<?php } ?>
								</select>
								<label class="input-title"><?php _e('Display Slider Description', 'ercs'); ?>:</label>
								<select name="slider_desc" id="slider_desc" class="slider-dir">
									<?php if($slider_options['sdesc'] == 'true') { ?>
									<option value="true" id="desc_on" selected="selected"><?php _e('Yes', 'ercs'); ?></option>
									<option value="false"><?php _e('No', 'ercs'); ?></option>
									<?php } else { ?>
									<option value="true"><?php _e('Yes', 'ercs'); ?></option>
									<option value="false" selected="selected"><?php _e('No', 'ercs'); ?></option>
									<?php } ?>
								</select>
								<div id="slider_desc_setup">
									<label class="input-title"><?php _e('Enter Excerpt Length', 'ercs'); ?><a href="#" class="ercs_tooltip" rel="<?php _e('Number of words to show for slider description.', 'ercs'); ?>"></a></label>
									<input type="number" name="excerpt_length" class="medium" id="excerpt_length" value="<?php echo $slider_options['excln']; ?>" min="10" max="1000" placeholder="e.g. 30" />
								</div>
							</div>
						</div><hr>
						<label class="input-title"><?php _e('Select slider order in', 'ercs'); ?>:<a href="#" class="ercs_tooltip" rel="<?php _e('Designates the ascending or descending order of the \'orderby\' parameter. Defaults to \'DESC\'. Ascending order from lowest to highest values (1, 2, 3; a, b, c). Descending order from highest to lowest values (3, 2, 1; c, b, a).', 'ercs'); ?>"></a></label>
						<select name="order_asc_desc" id="order_asc_desc" class="slider-dir">
							<?php if($slider_options['asdes'] == 'ASC') { ?>
							<option value="ASC" selected="selected"><?php _e('Ascending', 'ercs'); ?></option>
							<option value="DESC"><?php _e('Descending', 'ercs'); ?></option>
							<?php } else { ?>
							<option value="ASC"><?php _e('Ascending', 'ercs'); ?></option>
							<option value="DESC" selected="selected"><?php _e('Descending', 'ercs'); ?></option>
							<?php } ?>
						</select>
						<label class="input-title"><?php _e('Display slider sorted by', 'ercs'); ?>:<a href="#" class="ercs_tooltip" rel="<?php _e('Sort retrieved slider by parameter. Defaults to \'date (post_date)\'.', 'ercs'); ?>"></a></label>
						<select name="sort_param" id="sort_param" class="slider-dir">
							<?php if($slider_options['sparam'] == 'ID') { ?>
							<option value="ID" selected="selected"><?php _e('Post ID', 'ercs'); ?></option>
							<option value="name"><?php _e('Post Name (post slug)', 'ercs'); ?></option>
							<option value="date"><?php _e('Post Date', 'ercs'); ?></option>
							<?php } elseif($slider_options['sparam'] == 'name') { ?>
							<option value="ID"><?php _e('Post ID', 'ercs'); ?></option>
							<option value="name" selected="selected"><?php _e('Post Name (post slug)', 'ercs'); ?></option>
							<option value="date"><?php _e('Post Date', 'ercs'); ?></option>
							<?php } else { ?>
							<option value="ID"><?php _e('Post ID', 'ercs'); ?></option>
							<option value="name"><?php _e('Post Name (post slug)', 'ercs'); ?></option>
							<option value="date" selected="selected"><?php _e('Post Date', 'ercs'); ?></option>
							<?php } ?>
						</select><hr>
					</div> <!--#general -->
			
					<div id="structure" class="advance-input">
						<label class="input-title"><?php _e('Slider Container Width', 'rcpig'); ?></label>
						<input type="number" name="container_width" class="medium" id="container_width" value="<?php echo $slider_options['cwidth']; ?>" min="1" max="100" placeholder="e.g. 100">
						<div id="not_full_screen">
							<label class="input-title"><?php _e('Slider Image Width', 'ercs'); ?></label>
							<input type="text" name="image_width" class="medium" id="image_width" value="<?php echo $slider_options['iwidth']; ?>" placeholder="e.g. 250px">
							<label class="input-title"><?php _e('Slider Image Height', 'ercs'); ?></label>
							<input type="text" name="image_height" class="medium" id="image_height" value="<?php echo $slider_options['iheight']; ?>" placeholder="e.g. 250px">
						</div>
						<div id="full_screen_mode">
							<label class="input-title"><?php _e('Slider Description Background Width', 'ercs'); ?></label>
							<input type="number" name="desc_width" class="medium" id="desc_width" value="<?php echo $slider_options['dwidth']; ?>" min="20" max="100" placeholder="e.g. 50" />
							<label class="input-title"><?php _e('Slider Image Maximum Height', 'ercs'); ?></label>
							<input type="text" name="max_height" class="medium" id="max_height" value="<?php echo $slider_options['mxhgt']; ?>" placeholder="e.g. 250px">
						</div><hr>
					</div> <!--#structure -->
			
					<div id="font" class="advance-input">
						<label class="input-title"><?php _e('Slider Title Font Size', 'ercs'); ?></label>
						<input type="text" name="title_font" class="medium" id="title_font" value="<?php echo $slider_options['tfsize']; ?>" placeholder="e.g. 24px">
						<label class="input-title"><?php _e('Slider Meta Font Size', 'ercs'); ?></label>
						<input type="text" name="meta_font" class="medium" id="meta_font" value="<?php echo $slider_options['mfsize']; ?>" placeholder="e.g. 14px">
						<label class="input-title"><?php _e('Slider Description Font Size', 'ercs'); ?></label>
						<input type="text" name="desc_font" class="medium" id="desc_font" value="<?php echo $slider_options['dfsize']; ?>" placeholder="e.g. 14px">
						<label class="input-title"><?php _e('Slider Button Font Size', 'ercs'); ?></label>
						<input type="text" name="button_font" class="medium" id="button_font" value="<?php echo $slider_options['bfsize']; ?>" placeholder="e.g. 14px">
						<label id="ribbon_label" class="input-title"><?php _e('Slider Ribbon Font Size', 'ercs'); ?></label>
						<input type="text" name="ribbon_font" class="medium" id="ribbon_font" value="<?php echo $slider_options['rfsize']; ?>" placeholder="e.g. 14px">
					</div> <!--#font -->
			
					<div id="color" class="advance-input">
						<table>
							<!--Background Color -->
							<tr class="table-header">
								<td colspan="2"><?php _e('Background Colors', 'ercs'); ?></td>
							</tr>
							<tr class="table-input">
								<th><label class="input-title"><?php _e('Slider Background Color', 'ercs'); ?></label></th>
								<td><input type="text" name="slider_color" class="slider_color" id="slider_color" value="<?php echo $slider_options['scolor']; ?>"></td>
							</tr>
							<tr id="img_brd_clr" class="table-input">
								<th><label class="input-title"><?php _e('Slider Image Shadow Color', 'ercs'); ?></label></th>
								<td><input type="text" name="slider_img_color" class="slider_img_color" id="slider_img_color" value="<?php echo $slider_options['siclr']; ?>"></td>
							</tr>
							<tr id="brd_color" class="table-input">
								<th><label class="input-title"><?php _e('Slider Border Color', 'ercs'); ?></label></th>
								<td><input type="text" name="border_color" class="border_color" id="border_color" value="<?php echo $slider_options['sbclr']; ?>"></td>
							</tr>
							<tr id="srb_color" class="table-input">
								<th><label class="input-title"><?php _e('Slider Ribbon Background Color', 'ercs'); ?></label></th>
								<td><input type="text" name="ribbon_bg" class="ribbon_bg" id="ribbon_bg" value="<?php echo $slider_options['srbclr']; ?>"></td>
							</tr>
							<tr id="srbtcolor" class="table-input">
								<th><label class="input-title"><?php _e('Slider Read More Button Color', 'ercs'); ?></label></th>
								<td><input type="text" name="button_color" class="button_color" id="button_color" value="<?php echo $slider_options['sbtclr']; ?>"></td>
							</tr>
							<tr id="srbthover" class="table-input">
								<th><label class="input-title"><?php _e('Slider Read More Button Hover', 'ercs'); ?></label></th>
								<td><input type="text" name="button_hover" class="button_hover" id="button_hover" value="<?php echo $slider_options['sbhvr']; ?>"></td>
							</tr>
							<tr id="srbtborder" class="table-input">
								<th><label class="input-title"><?php _e('Slider Read More Button Border', 'ercs'); ?></label></th>
								<td><input type="text" name="button_border" class="button_border" id="button_border" value="<?php echo $slider_options['sbbrd']; ?>"></td>
							</tr>
							<tr id="stb_color" class="table-input">
								<th><label class="input-title"><?php _e('Slider Title Background Color', 'ercs'); ?></label></th>
								<td><input type="text" name="title_bg" class="title_bg" id="title_bg" value="<?php echo $slider_options['stbclr']; ?>"></td>
							</tr>
							<tr id="sdb_color" class="table-input">
								<th><label class="input-title"><?php _e('Slider Description Background Color', 'ercs'); ?></label></th>
								<td><input type="text" name="desc_bg" class="desc_bg" id="desc_bg" value="<?php echo $slider_options['sdbclr']; ?>" /></td>
							</tr>
							<!--Font Color -->
							<tr class="table-header">
								<td colspan="2"><?php _e('Font Colors', 'ercs'); ?></td>
							</tr>
							<tr id="srf_color" class="table-input">
								<th><label class="input-title"><?php _e('Slider Ribbon Font Color', 'ercs'); ?></label></th>
								<td><input type="text" name="ribbon_color" class="ribbon_color" id="ribbon_color" value="<?php echo $slider_options['srclr']; ?>"></td>
							</tr>
							<tr class="table-input">
								<th><label class="input-title"><?php _e('Slider Content Link Color', 'ercs'); ?></label></th>
								<td><input type="text" name="link_color" class="link_color" id="link_color" value="<?php echo $slider_options['slclr']; ?>"></td>
							</tr>
							<tr class="table-input">
								<th><label class="input-title"><?php _e('Slider Content Link Hover', 'ercs'); ?></label></th>
								<td><input type="text" name="link_hover" class="link_hover" id="link_hover" value="<?php echo $slider_options['slhvr']; ?>"></td>
							</tr>
							<tr class="table-input">
								<th><label class="input-title"><?php _e('Slider Content Font Color', 'ercs'); ?></label></th>
								<td><input type="text" name="content_color" class="content_color" id="content_color" value="<?php echo $slider_options['scclr']; ?>"></td>
							</tr>
							<tr id="srmcolor" class="table-input">
								<th><label class="input-title"><?php _e('Slider Read More Color', 'ercs'); ?></label></th>
								<td><input type="text" name="morer_color" class="morer_color" id="morer_color" value="<?php echo $slider_options['rmclr']; ?>"></td>
							</tr>
							<tr id="srmhover" class="table-input">
								<th><label class="input-title"><?php _e('Slider Read More Hover Color', 'ercs'); ?></label></th>
								<td><input type="text" name="morer_hover" class="morer_hover" id="morer_hover" value="<?php echo $slider_options['rmhvr']; ?>"></td>
							</tr>
						</table>
					</div> <!--#color -->
			
					<div id="advance" class="advance-input">
						<label class="input-title"><?php _e('Featured Slider Transition Duration (in ms)', 'ercs'); ?></label>
						<input type="number" name="tran_duration" class="medium" id="tran_duration" value="<?php echo $slider_options['trdur']; ?>" min="100" max="10000" placeholder="e.g. 500">
						<label class="input-title"><?php _e('Disable Slider Pager', 'ercs'); ?>:</label>
							<select name="slider_pager" id="slider_pager" class="slider-dir">
							<?php if($slider_options['spager'] == 'false') { ?>
							<option id="pager_off" value="false" selected="selected"><?php _e('Yes', 'ercs'); ?></option>
							<option value="true"><?php _e('No', 'ercs'); ?></option>
							<?php } else { ?>
							<option id="pager_off" value="false"><?php _e('Yes', 'ercs'); ?></option>
							<option value="true" selected="selected"><?php _e('No', 'ercs'); ?></option>
							<?php } ?>
						</select>
						<label class="input-title"><?php _e('Disable Slider Controls', 'ercs'); ?>:</label>
						<select name="slider_control" id="slider_control" class="slider-dir">
							<?php if($slider_options['sctrl'] == 'false') { ?>
							<option value="false" selected="selected"><?php _e('Yes', 'ercs'); ?></option>
							<option value="true"><?php _e('No', 'ercs'); ?></option>
							<?php } else { ?>
							<option value="false"><?php _e('Yes', 'ercs'); ?></option>
							<option value="true" selected="selected"><?php _e('No', 'ercs'); ?></option>
							<?php } ?>
						</select>
						<label class="input-title"><?php _e('Disable Automatically Transition', 'ercs'); ?>:</label>
						<select name="auto_transition" id="auto_transition" class="slider-dir">
							<?php if($slider_options['autotr'] == 'false') { ?>
							<option value="false" selected="selected"><?php _e('Yes', 'ercs'); ?></option>
							<option value="true"><?php _e('No', 'ercs'); ?></option>
							<?php } else { ?>
							<option value="false"><?php _e('Yes', 'ercs'); ?></option>
							<option value="true" selected="selected"><?php _e('No', 'ercs'); ?></option>
							<?php } ?>
						</select>
						<label class="input-title"><?php _e('Amount of time (in ms) between each auto transition', 'ercs'); ?></label>
						<input type="number" name="tran_time" class="medium" id="tran_time" value="<?php echo $slider_options['trtime']; ?>" min="1000" max="50000" placeholder="e.g. 4000">
						<label class="input-title"><?php _e('Disable Dynamically Adjust Slider Height', 'ercs'); ?>:</label>
						<select name="dynamic_height" id="dynamic_height" class="slider-dir">
							<?php if($slider_options['dyhgt'] == 'false') { ?>
							<option value="false" selected="selected"><?php _e('Yes', 'ercs'); ?></option>
							<option value="true"><?php _e('No', 'ercs'); ?></option>
							<?php } else { ?>
							<option value="false"><?php _e('Yes', 'ercs'); ?></option>
							<option id="adaptive_height" value="true" selected="selected"><?php _e('No', 'ercs'); ?></option>
							<?php } ?>
						</select>
					</div> <!--#advance -->
				</div> <!--#tabs -->
			</div> <!--#settingsliderdiv -->
			<div class="ercs-clear"></div>
			<input type="hidden" name="checkbox_value" value="<?php echo $checkValue; ?>">
			<input type="submit" id="ercs_process" name="ercs_process" class="button-primary" value="<?php if(!$slider_options) { _e('Add Gallery', 'ercs'); } else { _e('Update Gallery', 'ercs');} ?>">
		</form>
	</div><?php
	ercs_sidebar(); ?>
</div><?php
if(isset($_POST['ercs_options']) && $_POST['ercs_options'] == "processoptions") {
	if( isset( $_POST['ercs_process'] ) ) { ercs_process_slider_options(); }
	echo "<meta http-equiv='refresh' content='0'>";
}
?>