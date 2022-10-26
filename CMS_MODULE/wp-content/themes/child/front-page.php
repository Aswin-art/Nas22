<?php get_header(); ?>
    <section id="featured">
        <div class="container w100 h100">
            <div class="row w100 h100">
                <div class="col d-flex aic jcc w100 h100">
                    <a href="#recommend" class="btn-main">Explore Anime</a>
                </div>
            </div>
        </div>
    </section>

    <?php
        $args = [
            'post_type' => 'animes',
            'orderby' => 'meta_value_num',
            'meta_key' => 'view_count',
            'posts_per_page' => 4
        ];

        $animes = new WP_Query($args);
    ?>
    <section id="recommend">
        <div class="container">
            <div class="row">
                <div class="col">
                    <h1>Anime Recomendation</h1>
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
    
    <?php
        $args = [
            'post_type' => 'animes',
            'posts_per_page' => 4,
            'order' => 'DESC'
        ];

        $animes = new WP_Query($args);
        // var_dump($animes);
    ?>

    <section id="recent">
        <div class="container">
            <div class="row">
                <div class="col">
                    <h1>Recent Updates</h1>
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

    <section id="backtop">
        <div class="container">
            <div class="row">
                <div class="col tac">
                    <div class="btn-wrapper">
                        <a href="#featured" class="btn-main">Back Top</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
<?php get_footer(); ?>