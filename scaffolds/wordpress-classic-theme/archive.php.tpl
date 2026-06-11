<?php
/**
 * Archive template.
 *
 * @package {{THEME_SLUG}}
 */

get_header();
?>

<main id="primary" class="site-main">
    <header class="archive-header">
        <h1 class="archive-title">
            <?php echo esc_html(get_the_archive_title()); ?>
        </h1>
        <div class="archive-description">
            <?php echo wp_kses_post(get_the_archive_description()); ?>
        </div>
    </header>

    <?php if (have_posts()) : ?>
        <div class="content-list">
            <?php
            while (have_posts()) :
                the_post();
                get_template_part('template-parts/cards/card', 'work');
            endwhile;
            ?>
        </div>

        <?php the_posts_pagination(); ?>
    <?php endif; ?>
</main>

<?php
get_footer();
