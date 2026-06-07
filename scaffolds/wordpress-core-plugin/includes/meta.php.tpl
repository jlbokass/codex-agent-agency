<?php
/**
 * Metadata registration and saving.
 *
 * @package {{PLUGIN_SLUG}}
 */

declare(strict_types=1);

if (! defined('ABSPATH')) {
    exit;
}

function {{PHP_PREFIX}}_register_meta_fields(): void
{
    /*
     * Register metadata with register_post_meta() or register_meta().
     * Sanitize input on save and escape output in the theme.
     */
}
add_action('init', '{{PHP_PREFIX}}_register_meta_fields');
