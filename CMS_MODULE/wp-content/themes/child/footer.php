</main>
<footer id="footer">
    <div class="socials d-flex aic jcc w100">
        <?php
            dynamic_sidebar('social');
        ?>
    </div>
    <p>Copyright &copy; <?php date('Y'); ?> | <?php echo get_bloginfo(); ?></p>
</footer>

<?php wp_footer(); ?>
</body>
</html>