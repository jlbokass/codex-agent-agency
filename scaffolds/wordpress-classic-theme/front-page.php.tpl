<?php
/**
 * Front page template.
 *
 * @package {{THEME_SLUG}}
 */

get_header();
?>

<main id="primary" class="site-main site-main--front">
    <?php get_template_part('template-parts/sections/hero'); ?>

    <?php
    while (have_posts()) :
        the_post();
        get_template_part('template-parts/content/content', 'page');
    endwhile;
    ?>
</main>

<?php
get_footer();
