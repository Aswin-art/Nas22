<?php get_header(); ?>
<?php
    global $wp;
    $site = home_url($wp->request);
    $args = [
        'posts_per_page' => -1,
    ];
    
    if($site == 'http://localhost/wordpress/anime-list/'){
        $args['post_type'] = 'animes';
    }elseif($site == 'http://localhost/wordpress/articles'){
        $args['post_type'] = 'articles';
    }else if($site == 'http://localhost/wordpress/genres/action'){
        $args['post_type'] = 'animes';
        $args['category'] = 6;
    }else if($site == 'http://localhost/wordpress/genres/comedy'){
        $args['post_type'] = 'animes';
        $args['category_id'] = 7;
    }else if($site == 'http://localhost/wordpress/genres/romance'){
        $args['post_type'] = 'animes';
        $args['category'] = 9;
    }else if($site == 'http://localhost/wordpress/genres/sport'){
        $args['post_type'] = 'animes';
        $args['category'] = 8;
    }

    if(@$_GET['sort'] == 'release_date'){
        $args['order'] = 'DESC';
    }

    if(@$_GET['sort'] == 'view_count'){
        $args['orderby'] = 'meta_value_num';
        $args['meta_key'] = 'view_count';
    }

    if(@$_GET['sort'] == 'anime_title'){
        $args['orderby'] = 'title';
        $args['order'] = 'ASC';
    }

    $animes = new WP_Query($args);
    // var_dump($animes);
?>
    <section id="archive">
        <div class="container">
            <div class="row">
                <div class="col">
                    <form action="" method="GET">
                        <label for="sort">Sort anime by:</label>
                        <select name="sort" id="sort">
                            <option value="view_count">View Count</option>
                            <option value="anime_title">Anime Title</option>
                            <option value="release_date">Realease Date</option>
                        </select>
                        <button type="submit">Sort anime</button>
                    </form>
                </div>
            </div>
            <div class="row col-4">
                <?php while($animes->have_posts()): $animes->the_post(); ?>
                    <div class="col">
                        <div class="card">
                            <img src="<?php the_post_thumbnail_url(); ?>" alt="image" class="card-img">
                            <div class="card-content">
                                <h1>
                                    <?php the_title(); ?>
                                </h1>
                                <p class="text-second"><?php the_field('release_date'); ?></p>
                                <p>
                                    <?php the_excerpt(); ?>
                                </p>
                                <div class="btn-wrapper">
                                    <a href="<?php the_permalink(); ?>" class="btn-sm">Watch</a>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php endwhile; wp_reset_query(); ?>
            </div>
        </div>
    </section>
<?php get_footer(); ?>