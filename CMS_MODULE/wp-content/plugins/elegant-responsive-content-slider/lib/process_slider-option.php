<?php
/*
 * Elegant Responsive Content Slider 1.0.1
 * By @realwebcare - http://www.realwebcare.com
 */
if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly 
function ercs_add_slider_content() {
	$si = 1;
	$elegant_slider = 'elegant_slider';
	$slider_items = $elegant_slider.'_items';
	$slider_table = get_option('sliderTables');
	if(!isset($slider_table)) {
		add_option('sliderTables', $elegant_slider);
	} else {
		update_option('sliderTables', $elegant_slider);
	}
	if(isset($_POST['postID'])) {
		foreach($_POST['postID'] as $key => $pid) {
			if($pid) {
				$slider_content['scoid'.$si] = intval( $pid );
				$slider_content['svlnk'.$si] = '';
				$slider_content['stype'.$si] = sanitize_text_field( $_POST['postTP'][$key] );
				$si++;
			} else {
				$slider_content['scoid'.$si] = '';
				$slider_content['svlnk'.$si] = '';
				$slider_content['stype'.$si] = '';
				$si++;
			}
		}
		add_option($slider_items, $slider_content);
	}
}
function ercs_edit_slider_content() {
	$si = 1; $count_item = 0;
	$elegant_slider = 'elegant_slider';
	$slider_items = $elegant_slider.'_items';
	$content_lists = get_option($slider_items);
	if(isset($_POST['postID'])) { $count_item = count($_POST['postID']); }
	if($count_item > 0) {
		foreach($_POST['postID'] as $key => $pid) {
			if($pid) {
				$slider_content['scoid'.$si] = intval( $pid );
				$slider_content['svlnk'.$si] = '';
				$slider_content['stype'.$si] = sanitize_text_field( $_POST['postTP'][$si-1] );
				$si++;
			}
		}
		update_option($slider_items, $slider_content);
	} else {
		$slider_content[] = '';
		delete_option($slider_items);
	}
}
function ercs_process_slider_options() {
	$elegant_slider = 'elegant_slider';
	$checkbox_value = $_POST['checkbox_value'] != '' ? $_POST['checkbox_value'] : 'add';
	$slider_option_text = array( 'rtitle' => 'ribbon_title', 'iwidth' => 'image_width', 'iheight' => 'image_height', 'mxhgt' => 'max_height', 'asdes' => 'order_asc_desc', 'sparam' => 'sort_param', 'sctent' => 'slider_content', 'stitle' => 'slider_title', 'sdesc' => 'slider_desc', 'tfsize' => 'title_font', 'mfsize' => 'meta_font', 'dfsize' => 'desc_font', 'bfsize' => 'button_font', 'rfsize' => 'ribbon_font', 'scolor' => 'slider_color', 'siclr' => 'slider_img_color', 'sbclr' => 'border_color', 'srbclr' => 'ribbon_bg', 'stbclr' => 'title_bg', 'sdbclr' => 'desc_bg', 'srclr' => 'ribbon_color', 'slclr' => 'link_color', 'slhvr' => 'link_hover', 'scclr' => 'content_color', 'rmclr' => 'morer_color', 'rmhvr' => 'morer_hover', 'sbtclr' => 'button_color', 'sbhvr' => 'button_hover', 'sbbrd' => 'button_border', 'spager' => 'slider_pager', 'sctrl' => 'slider_control', 'autotr' => 'auto_transition', 'dyhgt' => 'dynamic_height' );
	foreach($slider_option_text as $key => $value) {
		if( isset( $_POST[$value] ) ) {
			$slider_option_value[$key] = sanitize_text_field( $_POST[$value] );
		}
	}
	$slider_option_num = array( 'cwidth' => 'container_width', 'excln' => 'excerpt_length', 'dwidth' => 'desc_width', 'trdur' => 'tran_duration', 'trtime' => 'tran_time' );
	foreach($slider_option_num as $key => $value) {
		if( isset( $_POST[$value] ) ) {
			$slider_option_number[$key] = intval( $_POST[$value] );
		}
	}
	$ercs_option = isset($_POST['ercs_option']) ? sanitize_text_field( $_POST['ercs_option'] ) : 'no';
	$full_screen = isset($_POST['full_screen']) ? sanitize_text_field( $_POST['full_screen'] ) : 'no';
	$slider_option = $elegant_slider.'_options';
	$slider_items = $elegant_slider.'_items';
	$slider_option_check = array( 'enable' => $ercs_option, 'fscrn' => $full_screen );
	$sliderOptions = array_merge($slider_option_value, $slider_option_number, $slider_option_check);
	if($checkbox_value == 'add') {
		add_option($slider_option, $sliderOptions);
	} elseif($checkbox_value == 'update') {
		update_option($slider_option, $sliderOptions);
	} else {
		add_option($slider_option, $sliderOptions);
	}
}
// Pull all the custom posts into an array
function ercs_all_posts_lists() {
	$args = array(
		'public'   => true,
		'_builtin' => false
	);
	$default_post = array( 'post', 'page' );
	$output = 'objects'; // names or objects, note names is the default
	$operator = 'and'; // 'and' or 'or'
	$post_types = get_post_types( $args, $output, $operator );
	foreach($post_types as $post_type) {
		$custom_posts[] = $post_type->name;
	}
	if(isset($custom_posts) && $custom_posts != '') {
		$custom_posts = array_merge($default_post, $custom_posts);
		return $custom_posts;
	} else {
		return $default_post;
	}
}
function ercs_post_category() {
	$ercs_category = array();
	if (get_post_type() == 'post') {
		$categories = get_the_category();
		foreach($categories as $category) {
			$temp_cat = '<a href="'.get_category_link($category->term_id).'">'.$category->name.'</a>';
			$ercs_category[] = $temp_cat;
		}
		$ercs_category = implode(', ', $ercs_category);
	} else {
		$taxonomies = get_object_taxonomies(get_post_type());
		foreach($taxonomies as $taxonomy) {
			if($taxonomy != 'post_tag') {
				$terms = get_the_terms( get_the_ID(), $taxonomy );
				foreach($terms as $term) {
					$temp_cat = '<a href="'.get_term_link($term->slug, $term->taxonomy).'">'.$term->name.'</a>';
					$ercs_category[] = $temp_cat;
				}
			}
		}
		$ercs_category = implode(', ', $ercs_category);
	}
	return $ercs_category;
}
function ercs_post_type_slider($slider) {
	$st = 1;
	$slider_items = get_option($slider.'_items');
	foreach($slider_items as $key => $item) {
		if($key == 'scoid'.$st) {
			if($slider_items['stype'.$st] == 'slider') {
				$slider_id[] = $slider_items['scoid'.$st];
			}
			$st++;
		}
	}
	return $slider_id;
}
function ercs_post_excerpt($length, $more='') {
	global $post;
	$ercs_excerpt = explode(' ', get_the_content(), $length);
	if($more != '') {
		$ercs_more = '<a class="ercs-more" href="'. get_permalink($post->ID) . '">' . $more . '</a>';
	}
	else { $ercs_more = ''; }
	if (count($ercs_excerpt) >= $length) {
		array_pop($ercs_excerpt);
		$ercs_excerpt = implode(" ",$ercs_excerpt);
		$ercs_excerpt = sanitize_text_field($ercs_excerpt);
		$ercs_excerpt = $ercs_excerpt . ' ... ' . $ercs_more;
	} else {
		$ercs_excerpt = implode(" ",$ercs_excerpt);
		$ercs_excerpt = sanitize_text_field($ercs_excerpt);
	}
	$ercs_excerpt = apply_filters('get_the_content', $ercs_excerpt);
	$ercs_excerpt = str_replace(']]>', ']]&gt;', $ercs_excerpt);
	$ercs_excerpt = str_replace("'", "\'", $ercs_excerpt);
	$ercs_excerpt = '<div class="slider-details">'.$ercs_excerpt.'</div>';
	return $ercs_excerpt;
}
/* Convert hexdec color string to rgb(a) string */
function ercs_hex2rgba($color, $opacity = false) {
	$default = 'rgb(0,0,0)';
	//Return default if no color provided
	if(empty($color))
		return $default;

	//Sanitize $color if "#" is provided
	if ($color[0] == '#' ) {
		$color = substr( $color, 1 );
	}
	//Check if color has 6 or 3 characters and get values
	if (strlen($color) == 6) {
		$hex = array( $color[0] . $color[1], $color[2] . $color[3], $color[4] . $color[5] );
	} elseif ( strlen( $color ) == 3 ) {
		$hex = array( $color[0] . $color[0], $color[1] . $color[1], $color[2] . $color[2] );
	} else {
		return $default;
	}
	//Convert hexadec to rgb
	$rgb =  array_map('hexdec', $hex);
	//Check if opacity is set(rgba or rgb)
	if($opacity) {
		if(abs($opacity) > 1)
			$opacity = 1.0;

		$output = 'rgba('.implode(",",$rgb).','.$opacity.')';
	} else {
		$output = 'rgb('.implode(",",$rgb).')';
	}
	//Return rgb(a) color string
	return $output;
}
?>