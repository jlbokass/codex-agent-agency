<?php
/**
 * Site header.
 *
 * @package {{THEME_SLUG}}
 */
?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
    <meta charset="<?php bloginfo('charset'); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
<?php wp_body_open(); ?>

<a class="skip-link screen-reader-text" href="#primary">
    <?php esc_html_e('Skip to content', '{{TEXT_DOMAIN}}'); ?>
</a>

<header class="site-header">
    <div class="site-header__inner">
        <div class="site-branding">
            <?php if (has_custom_logo()) : ?>
                <?php the_custom_logo(); ?>
            <?php else : ?>
                <a class="site-branding__name" href="<?php echo esc_url(home_url('/')); ?>">
                    <?php echo esc_html(get_bloginfo('name')); ?>
                </a>
            <?php endif; ?>
        </div>

        <nav class="site-navigation" aria-label="<?php esc_attr_e('Primary navigation', '{{TEXT_DOMAIN}}'); ?>">
            <?php
            wp_nav_menu([
                'theme_location' => 'primary',
                'container'      => false,
                'fallback_cb'    => false,
                'menu_class'     => 'site-navigation__menu',
                'depth'          => 2,
            ]);
            ?>
        </nav>
    </div>
</header>
