<?php
/**
 * Taxonomy registration.
 *
 * @package {{PLUGIN_SLUG}}
 */

declare(strict_types=1);

if (! defined('ABSPATH')) {
    exit;
}

function {{PHP_PREFIX}}_register_taxonomies(): void
{
    /*
     * Register project-specific taxonomies here when they improve filtering,
     * navigation, or admin organization.
     */
}
add_action('init', '{{PHP_PREFIX}}_register_taxonomies');
