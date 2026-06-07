<?php
/**
 * Theme setup.
 *
 * @package {{THEME_SLUG}}
 */

declare(strict_types=1);

if (! defined('ABSPATH')) {
    exit;
}

function {{PHP_PREFIX}}_theme_setup(): void
{
    load_theme_textdomain('{{TEXT_DOMAIN}}', get_template_directory() . '/languages');

    add_theme_support('title-tag');
    add_theme_support('post-thumbnails');
    add_theme_support('custom-logo');
    add_theme_support('responsive-embeds');
    add_theme_support('editor-styles');
    add_theme_support('html5', [
        'search-form',
        'comment-form',
        'comment-list',
        'gallery',
        'caption',
        'style',
        'script',
    ]);

    register_nav_menus([
        'primary' => esc_html__('Primary menu', '{{TEXT_DOMAIN}}'),
        'footer'  => esc_html__('Footer menu', '{{TEXT_DOMAIN}}'),
    ]);
}
add_action('after_setup_theme', '{{PHP_PREFIX}}_theme_setup');
