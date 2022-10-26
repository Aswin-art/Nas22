<?php
/*
 * Elegant Responsive Content Slider 1.0.2
 * By @realwebcare - https://www.realwebcare.com
 */
if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly 
$slider_table = get_option('sliderTables');
$eslider = 'elegant_slider';
$slider_items = '';
if($slider_table) {
	$list_item = ucwords(str_replace('_', ' ', $eslider));
	$slider_items = get_option($eslider.'_items');
	$itemNum = count($slider_items)/3;
} ?>
<div class="wrap">
	<div id="add_new_slider" class="postbox-container">
		<h2 class="slider-header"><?php _e('Elegant Slider', 'ercs'); ?> <?php if($slider_items != '') { ?><a href="#" id="process_content" class="add-new-h2"><?php _e('Edit Content', 'ercs'); ?></a><?php } else { ?><a href="#" id="process_content" class="add-new-h2"><?php _e('Add Content', 'ercs'); ?></a><?php } ?><span id="ercs-loading-image"></span></h2><?php
		if($slider_items == '') : ?>
		<form method="post" id="ercs_process_content" enctype="multipart/form-data" action="">
			<input type="hidden" name="add_slider_content" value="addslider" >
			<div id="slidercontentdiv">
				<div class="slidercontentwrap">
					<h3><?php _e('Add Slider Content', 'ercs'); ?></h3>
					<table id="slider_additem" cellspacing="0">
						<tr class="sliderheader">
							<th><?php _e('Post ID', 'ercs'); ?></th>
							<th><?php _e('Video Link', 'ercs'); ?></th>
							<th><?php _e('Post Type', 'ercs'); ?></th>
							<th><?php _e('Actions', 'ercs'); ?></th>
						</tr>
						<tr class="sliderbody">
							<td><input type="text" name="postID[]" value="" placeholder="<?php _e('Enter post ID', 'ercs'); ?>" required></td>
							<td><input type="text" name="vidLink[]" value="" placeholder="<?php _e('Premium Only', 'ercs'); ?>" disabled></td>
							<td>
								<select name="postTP[]" id="postTP">
									<option value="slider" selected="selected"><?php _e('Slider', 'ercs'); ?></option>
									<option value="carousel" disabled><?php _e('Carousel (Premium Only)', 'ercs'); ?></option>
								</select>
							</td>
							<td width="2%"><span id="remDisable"></span></td>
						</tr>
					</table>
					<input type="button" id="addpost" class="button-primary" value="Add New" >
				</div>
				<input type="submit" id="ercs_add_content" name="ercs_add_content" class="button-primary" value="Add Content" >
			</div>
		</form><?php
		else : ?>
		<form method="post" id="ercs_process_content" enctype="multipart/form-data" action="">
			<input type="hidden" name="edit_slider_content" value="editslider">
			<div id="slidercontentdiv">
				<div class="slidercontentwrap">
					<h3><?php _e('Edit/Add Slider Content', 'ercs'); ?></h3>
					<table id="slider_edititem" cellspacing="0">
						<tr class="sliderheader">
							<th><?php _e('Post ID', 'ercs'); ?></th>
							<th><?php _e('Post Name', 'ercs'); ?></th>
							<th><?php _e('Video Link', 'ercs'); ?></th>
							<th><?php _e('Post Type', 'ercs'); ?></th>
							<th><?php _e('Actions', 'ercs'); ?></th>
						</tr><?php
						for($i = 1; $i <= $itemNum; $i++) { ?>
						<tr class="sliderbody">
							<td width="2%"><input type="text" name="postID[<?php echo 'scoid'.$i; ?>]" value="<?php echo $slider_items['scoid'.$i]; ?>" placeholder="<?php _e('Enter post ID', 'ercs'); ?>" size="5" required></td>
							<td width="60%"><a href="<?php echo esc_url( get_permalink( $slider_items['scoid'.$i] ) ); ?>" alt="<?php echo esc_attr( get_the_title($slider_items['scoid'.$i]) )?>" target="_blank"><?php echo get_the_title($slider_items['scoid'.$i]); ?></a></td>
							<td width="20%"><input type="text" name="vidLink[]" value="" placeholder="<?php _e('Premium Only', 'ercs'); ?>" disabled></td>
							<td width="15%">
								<select name="postTP[]" id="postTP">
									<option value="slider" selected="selected"><?php _e('Slider', 'ercs'); ?></option>
									<option value="carousel" disabled><?php _e('Carousel (Premium Only)', 'ercs'); ?></option>
								</select>
							</td>
							<td><span id="remContent"></span></td>
						</tr><?php
						} ?>
					</table>
					<input type="button" id="editpost" class="button-primary" value="Add New">
				</div>
				<input type="submit" id="ercs_edit_content" name="ercs_edit_content" class="button-primary" value="Update">
			</div>
			<p class="slider_notice"><?php _e('*** You can reorder slider posts by dragging with the mouse ***', 'ercs'); ?></p>
		</form><?php
		endif;
		if($slider_table && $slider_items != '') : ?>
		<div class="slider_list">
			<table id="ercs_list" class="form-table">
				<thead>
					<tr>
						<th><?php _e('SN', 'ercs'); ?></th>
						<th><?php _e('Post ID', 'ercs'); ?></th>
						<th><?php _e('Post Title', 'ercs'); ?></th>
						<th><?php _e('Post Type', 'ercs'); ?></th>
					</tr>
				</thead>
				<tbody id="ercs_<?php echo $eslider; ?>"><?php
				for($sl = 1; $sl <= $itemNum; $sl++) { ?>
					<tr<?php if($sl % 2 == 0) { echo ' class="alt"'; } ?>>
						<td width="2%"><?php echo $sl; ?></td>
						<td width="10%"><?php echo $slider_items['scoid'.$sl]; ?></td>
						<td><a href="<?php echo esc_url( get_permalink( $slider_items['scoid'.$sl] ) ); ?>" alt="<?php echo esc_attr( get_the_title($slider_items['scoid'.$sl]) )?>" target="_blank"><?php echo get_the_title($slider_items['scoid'.$sl]); ?></a></td>
						<td width="10%">Slider</td>
					</tr><?php
				} ?>
				</tbody>
			</table>
		</div><?php
		else : ?>
		<div class="slider_list"><p class="get_started"><?php _e('You didn\'t add any slider content yet! Click on <strong>Add Content</strong> button to get started.', 'ercs'); ?></p></div><?php
		endif; ?>
	</div><?php
	ercs_sidebar(); ?>
</div>