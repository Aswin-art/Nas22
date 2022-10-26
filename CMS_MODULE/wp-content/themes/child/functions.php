<?php

function load_scripts(){
    wp_enqueue_style('child-css', get_stylesheet_directory_uri() . '/style.css', array(), false, 'all');
    wp_enqueue_script('child-js', get_stylesheet_directory_uri() . '/main.js', array('jquery'), false, true);
}

add_action('wp_enqueue_scripts', 'load_scripts');

add_action('login_enqueue_scripts', function(){
    ?>
        <style>
            #login h1 a{
                display: none;
            }
            body{
                background-image: url('http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-1.jpg') !important;
            }
        </style>
    <?php
});

function add_cpt(){
    $args = [
        'public' => true,
        'label' => 'Anime',
        'has_archive' => 'anime-list',
        'rewrite' => ['slug' => 'anime'],
        'supports' => ['title', 'editor', 'thumbnail', 'excerpt', 'tags']
    ];

    register_post_type('animes', $args);

    $args = [
        'public' => true,
        'label' => 'Article',
        'has_archive' => 'articles',
        'rewrite' => ['slug' => 'post/article'],
        'supports' => ['title', 'editor', 'thumbnail', 'excerpt']
    ];

    register_post_type('articles', $args);
}

function add_taxonomies(){
    $args = [
        'label' => 'Anime Genre',
        'has_archive' => 'genres',
        'hierarchical' => true,
        'public' => true,
        'rewrite' => ['slug' => 'genres']
    ];

    register_taxonomy('genres', ['animes'], $args);

    $args = [
        'label' => 'Anime Season',
        'has_archive' => 'seasons',
        'hierarchical' => false,
        'public' => true,
        'rewrite' => ['slug' => 'seasons']
    ];

    register_taxonomy('seasons', ['animes'], $args);

    $args = [
        'public' => true,
        'label' => 'Article',
        'has_archive' => 'articles',
        'rewrite' => ['slug' => 'article'],
        'supports' => ['title', 'editor', 'thumbnail', 'excerpt']
    ];

    register_taxonomy('article', ['articles'], $args);
}

add_action('init', 'add_cpt');
add_action('init', 'add_taxonomies');


function set_view_count($Post_ID){
    $count_key = 'view_count';
    $count = get_post_meta($Post_ID, $count_key, true);

    if($count == ''){
        add_post_meta($Post_ID, $count_key, '0', true);
        $count = 0;
    }else{
        $count++;
        update_post_meta($Post_ID, $count_key, $count);
    }

    return $count;
}

function set_rating($rating, $Post_ID){
    $count_key = 'rating';
    $count = get_post_meta($Post_ID, $count_key, true);
    if($count == ''){
        delete_post_meta($Post_ID, $count_key);
        add_post_meta($Post_ID, $count_key, $rating);
    }else{
        $count = $rating;
        update_post_meta($Post_ID, $count_key, $count);
    }

    return $count;
}

function get_rating($Post_ID){
    $count_key = 'rating';
    $count = get_post_meta($Post_ID, $count_key, true);

    if($count == ''){
        $count = 0;
        delete_post_meta($Post_ID, $count_key);
        add_post_meta($Post_ID, $count_key, '0');
    }

    return $count;
}

add_action('save_post', 'set_view_count');

function add_widgets(){
    $args = [
        'name' => 'Social icons',
        'id' => 'social',
        'before_widget' => '',
        'after_widget' => '',
    ];

    register_sidebar($args);
}

add_action('widgets_init', 'add_widgets');