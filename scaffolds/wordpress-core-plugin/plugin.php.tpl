<?php
/**
 * Plugin Name: {{PLUGIN_NAME}}
 * Plugin URI:
 * Description: Core content structures and business logic for {{PLUGIN_NAME}}.
 * Version: 0.1.0
 * Requires at least: 6.4
 * Requires PHP: 8.1
 * Author: {{AUTHOR_NAME}}
 * Author URI:
 * License: GPL-2.0-or-later
 * License URI: https://www.gnu.org/licenses/gpl-2.0.html
 * Text Domain: {{TEXT_DOMAIN}}
 *
 * @package {{PLUGIN_SLUG}}
 */

declare(strict_types=1);

if (! defined('ABSPATH')) {
    exit;
}

define('{{PHP_PREFIX}}_PLUGIN_FILE', __FILE__);
define('{{PHP_PREFIX}}_PLUGIN_DIR', plugin_dir_path(__FILE__));
define('{{PHP_PREFIX}}_PLUGIN_URL', plugin_dir_url(__FILE__));

require_once {{PHP_PREFIX}}_PLUGIN_DIR . 'includes/post-types.php';
require_once {{PHP_PREFIX}}_PLUGIN_DIR . 'includes/taxonomies.php';
require_once {{PHP_PREFIX}}_PLUGIN_DIR . 'includes/meta.php';
require_once {{PHP_PREFIX}}_PLUGIN_DIR . 'includes/admin.php';
