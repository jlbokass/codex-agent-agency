<?php
/**
 * Single post template.
 *
 * @package {{THEME_SLUG}}
 */

get_header();
?>

<main id="primary" class="site-main">
    <?php
    while (have_posts()) :
        the_post();
        ?>
        <article id="post-<?php the_ID(); ?>" <?php post_class('single-entry'); ?>>
            <header class="single-entry__header">
                <h1 class="single-entry__title">
                    <?php echo esc_html(get_the_title()); ?>
                </h1>
                <?php {{PHP_PREFIX}}_posted_on(); ?>
            </header>

            <div class="single-entry__content">
                <?php the_content(); ?>
            </div>
        </article>
        <?php
    endwhile;
    ?>
</main>

<?php
get_footer();
