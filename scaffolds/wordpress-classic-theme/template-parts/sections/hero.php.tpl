<?php
/**
 * Generic front-page hero section.
 *
 * @package {{THEME_SLUG}}
 */
?>

<section class="hero">
    <div class="hero__inner">
        <p class="hero__eyebrow">
            <?php echo esc_html(get_bloginfo('description')); ?>
        </p>

        <h1 class="hero__title">
            <?php echo esc_html(get_bloginfo('name')); ?>
        </h1>

        <?php if (has_post_thumbnail()) : ?>
            <div class="hero__media">
                <?php the_post_thumbnail('large'); ?>
            </div>
        <?php endif; ?>
    </div>
</section>
