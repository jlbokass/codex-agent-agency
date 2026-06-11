<?php
/**
 * Theme bootstrap for {{THEME_NAME}}.
 *
 * @package {{THEME_SLUG}}
 */

declare(strict_types=1);

if (! defined('ABSPATH')) {
    exit;
}

require_once get_template_directory() . '/inc/helpers.php';
require_once get_template_directory() . '/inc/setup.php';
require_once get_template_directory() . '/inc/enqueue.php';
require_once get_template_directory() . '/inc/template-tags.php';
