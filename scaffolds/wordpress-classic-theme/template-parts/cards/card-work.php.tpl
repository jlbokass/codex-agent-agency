<?php
/**
 * Generic content card.
 *
 * @package {{THEME_SLUG}}
 */
?>

<article id="post-<?php the_ID(); ?>" <?php post_class('content-card'); ?>>
    <?php if (has_post_thumbnail()) : ?>
        <a class="content-card__media" href="<?php the_permalink(); ?>" aria-hidden="true" tabindex="-1">
            <?php the_post_thumbnail('medium_large'); ?>
        </a>
    <?php endif; ?>

    <div class="content-card__body">
        <h2 class="content-card__title">
            <a href="<?php echo esc_url(get_permalink()); ?>">
                <?php echo esc_html(get_the_title()); ?>
            </a>
        </h2>

        <?php if ({{PHP_PREFIX}}_has_excerpt()) : ?>
            <p class="content-card__excerpt">
                <?php echo esc_html(get_the_excerpt()); ?>
            </p>
        <?php endif; ?>

        <a class="content-card__link" href="<?php echo esc_url(get_permalink()); ?>">
            <?php echo esc_html({{PHP_PREFIX}}_read_more_label()); ?>
        </a>
    </div>
</article>
