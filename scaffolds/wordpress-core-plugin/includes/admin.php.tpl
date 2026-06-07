<?php
/**
 * Admin customizations.
 *
 * @package {{PLUGIN_SLUG}}
 */

declare(strict_types=1);

if (! defined('ABSPATH')) {
    exit;
}

function {{PHP_PREFIX}}_admin_init(): void
{
    /*
     * Add admin columns, helper text, settings, or editor improvements here.
     * Check capabilities before state-changing admin actions.
     */
}
add_action('admin_init', '{{PHP_PREFIX}}_admin_init');
