<?php
/**
 * Custom Post Type registration.
 *
 * @package {{PLUGIN_SLUG}}
 */

declare(strict_types=1);

if (! defined('ABSPATH')) {
    exit;
}

function {{PHP_PREFIX}}_register_post_types(): void
{
    /*
     * Register project-specific Custom Post Types here.
     * Keep labels editor-friendly and avoid presentation decisions in the plugin.
     */
}
add_action('init', '{{PHP_PREFIX}}_register_post_types');
