<?php get_header(); ?>
<?php 
set_view_count(get_the_ID());
$rating = (@$_POST['rating']) ? $_POST['rating'] : 0;

set_rating($rating, get_the_ID());
?>
    <section id="detail">
        <div class="container">
            <div class="row">
                <div class="col">
                    <img src="<?php the_post_thumbnail_url(); ?>" alt="image">
                    <h1 class="mt-1">
                        <?php the_title(); ?>
                    </h1>

                    <div class="info mt-1">
                        <p class="text-second">
                            <?php the_field('release_date'); ?>
                        </p>
                        <p>Number of episodes: <?php the_field('number_episode'); ?></p>
                        <p>Episode Link: <a href="<?php the_field('episode_link'); ?>"><?php the_field('episode_link'); ?></a></p>
                        <p>
                            Rating: <?php echo get_rating(get_the_ID()); ?>
                        </p>
                    </div>

                    <div class="content mt-1">
                        <p>
                            <?php the_content(); ?>
                        </p>
                    </div>

                    <div class="rating mt-1">
                        <form action="" method="post">
                            <select name="rating" id="rating">
                                <option value="1">1 star</option>
                                <option value="2">2 star</option>
                                <option value="3">3 star</option>
                                <option value="4">4 star</option>
                                <option value="5">5 star</option>
                            </select>
                            <button type="submit">Confirm</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
<?php get_footer(); ?>