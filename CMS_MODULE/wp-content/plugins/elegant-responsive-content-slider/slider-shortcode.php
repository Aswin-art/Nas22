<?php
/* Elegant Responsive Content Slider 1.0.2
 * By @realwebcare - https://www.realwebcare.com
 */
if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly 
function ercs_shortcode_function( $atts ){
	extract(shortcode_atts(array(
		'sid' => 1,
		'full' => 0
	), $atts, 'elegant-slider'));
	$slider = 'elegant_slider';
	$slider_id = strtolower($slider) . '-' .$sid;
	$slider_options = get_option($slider.'_options');
	$slider_items = get_option($slider.'_items');
	if($slider_options['enable'] == 'yes') {
		if($slider_options != '' && $slider_items != '') {
			wp_register_script('ercs-modernizr', plugins_url( '/assets/js/modernizr.custom.js', __FILE__ ), array('jquery'), '2.6.2', false);
			wp_register_script('bxslider', plugins_url( '/assets/js/jquery.bxslider.min.js', __FILE__ ), array('jquery'), '4.1.1', false);
			wp_enqueue_script('ercs-modernizr');
			wp_enqueue_script('bxslider');
			wp_enqueue_style('ercs-front-css', plugins_url('/assets/css/ercs-front.css', __FILE__),'','1.0.2');
		}
		if($slider_items) {
			if($slider_options) {
				if($slider_options['fscrn'] == 'yes' || $full == 1) {
					$slider_mode = 'horizontal';
				} else { $slider_mode = 'fade'; }
				$slider_duration = $slider_options['trdur'] != '' ? $slider_options['trdur'] : 500;
				if(isset($slider_options['sctent']) && $slider_options['sctent'] !='') {
					$slider_caption = $slider_options['sctent'];
				} else {
					$slider_caption = 'false';
				}
				$slider_pager = $slider_options['spager'] != '' ? $slider_options['spager'] : 'false';
				$slider_control = $slider_options['sctrl'] != '' ? $slider_options['sctrl'] : 'false';
				$slider_tran = $slider_options['autotr'] != '' ? $slider_options['autotr'] : 'false';
				$dynamic_height = $slider_options['dyhgt'] != '' ? $slider_options['dyhgt'] : 'false';
				$slider_speed = $slider_options['trtime'] != '' ? $slider_options['trtime'] : 4000;
				$title_bg = $slider_options['stbclr'] != '' ? $slider_options['stbclr'] : '#000000';
				$desc_bg = $slider_options['sdbclr'] != '' ? $slider_options['sdbclr'] : '#000000';
				$title_rgba = ercs_hex2rgba($title_bg, '0.7');
				$desc_rgba = ercs_hex2rgba($desc_bg, '0.7'); ?>
<!--BX Slider -->
<script type="text/javascript">
jQuery(document).ready(function() {
	var slider = jQuery('#slider<?php echo $sid; ?>').bxSlider({
		preloadImages: 'all',
		mode: '<?php echo $slider_mode; ?>',
		speed: <?php echo $slider_duration; ?>,
		pause: <?php echo $slider_speed; ?>,
		responsive: true,
<?php if($dynamic_height == 'true') { ?>
		adaptiveHeight: <?php echo $dynamic_height; ?>,
<?php } ?>
		touchEnabled: true,
		captions: <?php echo $slider_caption; ?>,
		controls: <?php echo $slider_control; ?>,
		auto: <?php echo $slider_tran; ?>,
		autoHover: true,
		pager: <?php echo $slider_pager; ?>,
		onSliderLoad: function () {
			jQuery(".ercs_content, .ercs_full_content .bxslider").css("visibility", "visible");
			jQuery('.bxslider .full-slider-container').eq(1).addClass('active-slide');
			jQuery(".ercs_full_content .full-slider-container h2, .ercs_full_content .full-slider-container .slider-details").css({'opacity' : 1});
			jQuery('.ercs_full_content .bx-wrapper img').attr('title','');
		},
		onSlideNext: function () {
			jQuery('.bxslider .full-slider-container').hide();
		},
		onSlidePrev: function () {
			jQuery('.bxslider .full-slider-container').hide();
		},
		onSlideAfter: function (currentSlideNumber, totalSlideQty, currentSlideHtmlObject) {
			console.log(currentSlideHtmlObject);
			jQuery('.bxslider .full-slider-container').fadeIn(500);
		},
		onSlideBefore: function () {
			jQuery(".first-slide.full-slider-container.active-slide").removeAttr('style');
		}
	});
});
</script>
<style type="text/css"><?php if($slider_options['cwidth'] != '') { ?>#ercs_<?php echo $slider_id; ?>{width:<?php echo $slider_options['cwidth'].'%'; ?>}<?php } ?><?php if($slider_options['fscrn'] != 'yes' && $full != 1) { ?><?php if($slider_options['rfsize'] != '' || $slider_options['srbclr'] != '') { ?>#ercs_<?php echo $slider_id; ?> .ercs-ribbon{<?php if($slider_options['rfsize'] != '') { ?>font-size:<?php echo $slider_options['rfsize']; ?>;<?php } ?><?php if($slider_options['srbclr'] != '') { ?>border-top-color:<?php echo $slider_options['srbclr']; ?><?php } ?>}<?php } ?><?php if($slider_options['srclr'] != '') { ?>#ercs_<?php echo $slider_id; ?> .ercs-ribbon span{color:<?php echo $slider_options['srclr']; ?>}<?php } ?>#ercs_<?php echo $slider_id; ?> .bx-wrapper .bx-viewport{<?php if($slider_options['scolor'] != '') { ?>background-color:<?php echo $slider_options['scolor']; ?> !important;<?php } ?><?php if($slider_options['sbclr'] != '') { ?>border-color:<?php echo $slider_options['sbclr']; ?> !important;<?php } ?>}<?php if($slider_options['siclr'] != '') { ?>#ercs_<?php echo $slider_id; ?> .bx-wrapper .slimg img{box-shadow: 1px 1px 5px <?php echo $slider_options['siclr']; ?>}<?php } ?><?php } ?><?php if($slider_options['slclr'] != '') { ?>#ercs_<?php echo $slider_id; ?> .text-pane h2 a, #ercs_<?php echo $slider_id; ?> .bx-wrapper .bx-caption .full-slider-container h2 a, #ercs_<?php echo $slider_id; ?> .text-pane .slider_postmeta a{color:<?php echo $slider_options['slclr']; ?>}<?php } ?><?php if($slider_options['slhvr'] != '') { ?>#ercs_<?php echo $slider_id; ?> .text-pane h2 a:hover, #ercs_<?php echo $slider_id; ?> .bx-wrapper .bx-caption .full-slider-container h2 a:hover, #ercs_<?php echo $slider_id; ?> .text-pane .slider_postmeta a:hover{color:<?php echo $slider_options['slhvr']; ?>}<?php } ?><?php if($slider_options['scclr'] != '') { ?>#ercs_<?php echo $slider_id; ?> .text-pane .slider-details, #ercs_<?php echo $slider_id; ?> .text-pane .slider_postmeta, #ercs_<?php echo $slider_id; ?> .text-pane .slider_postmeta  span.ercs_awesome i, #ercs_<?php echo $slider_id; ?> .bx-wrapper .bx-caption .full-slider-container h2, #ercs_<?php echo $slider_id; ?> .bx-wrapper .bx-caption .full-slider-container .slider-details{color:<?php echo $slider_options['scclr']; ?>}<?php } ?><?php if($slider_options['tfsize'] != '') { ?>#ercs_<?php echo $slider_id; ?> .text-pane h2, #ercs_<?php echo $slider_id; ?> .bx-wrapper .bx-caption .full-slider-container h2{font-size:<?php echo $slider_options['tfsize']; ?>}<?php } ?><?php if($slider_options['mfsize'] != '') { ?>#ercs_<?php echo $slider_id; ?> .text-pane .slider_postmeta{font-size:<?php echo $slider_options['mfsize']; ?>}<?php } ?><?php if($slider_options['dfsize'] != '') { ?>#ercs_<?php echo $slider_id; ?> .text-pane .slider-details{font-size:<?php echo $slider_options['dfsize']; ?>}<?php } ?><?php if($slider_options['rmclr'] != '' || $slider_options['sbtclr'] != '' || $slider_options['bfsize'] != '') { ?>#ercs_<?php echo $slider_id; ?> .text-pane .slider-details a.ercs-more, #ercs_<?php echo $slider_id; ?> .bx-wrapper .bx-caption .full-slider-container a.full_more{<?php if($slider_options['rmclr'] != '') { ?>color:<?php echo $slider_options['rmclr']; ?>;<?php } ?><?php if($slider_options['sbtclr'] != '') { ?>background-color:<?php echo $slider_options['sbtclr']; ?>;border-color:<?php echo $slider_options['sbbrd']; ?>;<?php } ?><?php if($slider_options['bfsize'] != '') { ?>font-size:<?php echo $slider_options['bfsize']; ?><?php } ?>}<?php } ?><?php if($slider_options['rmhvr'] != '' || $slider_options['sbhvr'] != '') { ?>#ercs_<?php echo $slider_id; ?> .text-pane .slider-details a.ercs-more:hover, #ercs_<?php echo $slider_id; ?> .bx-wrapper .bx-caption .full-slider-container a.full_more:hover{<?php if($slider_options['rmhvr'] != '') { ?>color:<?php echo $slider_options['rmhvr']; ?>;<?php } ?><?php if($slider_options['sbhvr'] != '') { ?>background-color:<?php echo $slider_options['sbhvr']; ?>;border-color:<?php echo $slider_options['sbhvr']; ?><?php } ?>}<?php } ?><?php if($slider_options['fscrn'] == 'yes' || $full == 1) { ?><?php if($slider_options['stbclr'] != '') { ?>#ercs_<?php echo $slider_id; ?> .bx-wrapper .bx-caption .full-slider-container h2{background:<?php echo $title_rgba; ?>}<?php } ?><?php if($slider_options['sdbclr'] != '' || $slider_options['dwidth'] != '') { ?>#ercs_<?php echo $slider_id; ?> .bx-wrapper .bx-caption .full-slider-container .slider-details{<?php if($slider_options['sdbclr'] != '') { ?>background:<?php echo $desc_rgba; ?>;<?php } ?><?php if($slider_options['dwidth'] != '') { ?>max-width:<?php echo $slider_options['dwidth'].'%'; ?><?php } ?>}<?php } ?><?php if($slider_options['mxhgt'] != '') { ?>#ercs_<?php echo $slider_id; ?> .bx-wrapper img {max-height:<?php echo $slider_options['mxhgt']; ?>}<?php } ?><?php } ?></style>
<?php
				if($slider_options['fscrn'] != 'yes' && $full != 1) { echo '<div id="ercs_'.$slider_id.'" class="ercs_content">'; }
				else { echo '<div id="ercs_'.$slider_id.'" class="ercs_full_content">'; }
				$slider_order = $slider_options['asdes'] != '' ? $slider_options['asdes'] : 'ASC';
				$slider_orderby = $slider_options['sparam'] != '' ? $slider_options['sparam'] : 'date';
				$all_posts = ercs_all_posts_lists();
				$slider_type = ercs_post_type_slider($slider);
				$es = 0; $vl = 1;
				rsort( $slider_type );
				$slider_type = array_slice( $slider_type, 0, 10 );
				$args = array( 'post_type' => $all_posts, 'post__in' => $slider_type, 'ignore_sticky_posts' => 1, 'orderby' => $slider_orderby, 'order' => $slider_order );
				$slider_query = new WP_Query( $args );
				if ($slider_query->have_posts()):
					if($slider_options['rtitle'] != '' && $slider_options['fscrn'] != 'yes' && $full != 1) { ?>
					<div class="ercs-ribbon"><span><?php echo $slider_options['rtitle']; ?></span></div><?php
					} ?>
					<ul id="slider<?php echo $sid; ?>" class="bxslider"><?php
						while( $slider_query->have_posts() ) : $slider_query->the_post();
							$thumb = get_post_thumbnail_id();
							$img_url = wp_get_attachment_url( $thumb,'full' );
							$image_thumb = aq_resize( $img_url, $slider_options['iwidth'], $slider_options['iheight'], true, true, true ); ?>
							<li class="slide-pane"><?php
							if($slider_options['fscrn'] != 'yes' && $full != 1) { ?>
								<div class="image-pane"><?php
								if ( has_post_thumbnail() ) { ?>
									<div class="slimg">
										<a href="<?php the_permalink() ?>"><img src="<?php echo $image_thumb; ?>" alt="slider-image" /></a>
									</div><?php
								} else { ?>
									<a href="<?php the_permalink() ?>"><img src="<?php echo catch_that_image(); ?>" alt="slider"/></a><?php
								} ?>
								</div>
								<div class="text-pane"><?php
									if($slider_options['stitle'] == 'true') { ?><h2><a href="<?php the_permalink() ?>" rel="bookmark" title="<?php the_title(); ?>"><?php the_title(); ?></a></h2><?php } ?>
									<div class="slider_postmeta">
										<div class="meta_items">
											<span class="ercs_awesome"><i class="fa fa-user" aria-hidden="true"></i><?php the_author_posts_link(); ?></span>
											<span class="ercs_awesome"><i class="fa fa-tags" aria-hidden="true"></i><?php echo ercs_post_category(); ?></span>
											<span class="ercs_awesome"><i class="fa fa-clock-o" aria-hidden="true"></i><?php the_time('M j, Y'); ?></span>
											<span class="ercs_awesome"><i class="fa fa-comment" aria-hidden="true"></i><?php comments_popup_link('0 comment', '1 comment', '% comments'); ?></span>
										</div>
									</div><?php
									$excerpt_length = $slider_options['excln'] != '' ? $slider_options['excln'] : 30;
									$slider_excerpt = ercs_post_excerpt($excerpt_length, 'Read More');
									echo $slider_excerpt; ?>
								</div><?php
							} else { ?>
								<div class="full-slider"><?php
									global $post;
									$num_comments = get_comments_number(); // get_comments_number returns only a numeric value
									if ( comments_open() ) {
										if ( $num_comments == 0 ) { $comments = __('No Comments');
										} elseif ( $num_comments > 1 ) { $comments = $num_comments . __(' Comments');
										} else { $comments = __('1 Comment'); }
										$write_comments = '<a href="' . get_comments_link() .'">'. $comments.'</a>';
									} else { $write_comments =  __('Comments off'); }
									$slider_content = '<div class="full-slider-content-wrap">';
									if($es == 0) { $slider_content .= '<div class="first-slide full-slider-container">';
									} else { $slider_content .= '<div class="full-slider-container">'; }
									if($slider_options['stitle'] == 'true') {
										$slider_content .= '<h2><a href="' . get_the_permalink() . '" rel="bookmark">' . get_the_title() . '</a></h2>';
									}
									if($slider_options['sdesc'] == 'true') {
										$excerpt_length = $slider_options['excln'] != '' ? $slider_options['excln'] : 30;
										$slider_content .= ercs_post_excerpt($excerpt_length, '');
									}
									$slider_content .= '</div></div>';
									if ( has_post_thumbnail() ) { ?>
										<div class="slimg">
											<a href="<?php the_permalink() ?>"><?php the_post_thumbnail('100%', array('title' => $slider_content)); ?></a>
										</div><?php
									} else { ?>
										<a href="<?php the_permalink() ?>"><img src="<?php echo catch_that_image(); ?>" alt="slider"/></a><?php
									} ?>
								</div><?php
							} ?>
							</li><?php
							$es++; $vl++;
						endwhile; wp_reset_query(); ?>
					</ul><?php
				endif;
				if($slider_options['fscrn'] != 'yes' && $full != 1) { echo '</div>'; }
			} else { _e( 'No Options Found!', 'ercs' ); }
		} else { _e( 'No Contents Found!', 'ercs' ); }
	} else { _e( 'Please, enable the slider.', 'ercs' ); }
}
add_shortcode( 'elegant-slider','ercs_shortcode_function' );
?>