<?php
/**
 * Page content.
 *
 * @package {{THEME_SLUG}}
 */
?>

<article id="post-<?php the_ID(); ?>" <?php post_class('page-content'); ?>>
    <header class="page-content__header">
        <h1 class="page-content__title">
            <?php echo esc_html(get_the_title()); ?>
        </h1>
    </header>

    <div class="page-content__body">
        <?php the_content(); ?>
    </div>
</article>
