<?php
/**
 * Main template file.
 *
 * @package {{THEME_SLUG}}
 */

get_header();
?>

<main id="primary" class="site-main">
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
    <?php else : ?>
        <section class="empty-state">
            <h1><?php esc_html_e('Nothing found', '{{TEXT_DOMAIN}}'); ?></h1>
            <p><?php esc_html_e('No content is available yet.', '{{TEXT_DOMAIN}}'); ?></p>
        </section>
    <?php endif; ?>
</main>

<?php
get_footer();
