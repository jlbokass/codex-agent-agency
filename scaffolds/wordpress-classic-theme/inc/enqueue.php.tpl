<?php
/**
 * Asset loading.
 *
 * @package {{THEME_SLUG}}
 */

declare(strict_types=1);

if (! defined('ABSPATH')) {
    exit;
}

function {{PHP_PREFIX}}_asset_version(string $relative_path): string
{
    $path = get_template_directory() . '/' . ltrim($relative_path, '/');

    if (file_exists($path)) {
        return (string) filemtime($path);
    }

    return wp_get_theme()->get('Version');
}

function {{PHP_PREFIX}}_enqueue_assets(): void
{
    wp_enqueue_style(
        '{{THEME_SLUG}}-style',
        get_stylesheet_uri(),
        [],
        {{PHP_PREFIX}}_asset_version('style.css')
    );

    $compiled_css = '/assets/dist/main.css';
    if (file_exists(get_template_directory() . $compiled_css)) {
        wp_enqueue_style(
            '{{THEME_SLUG}}-main',
            get_template_directory_uri() . $compiled_css,
            ['{{THEME_SLUG}}-style'],
            {{PHP_PREFIX}}_asset_version($compiled_css)
        );
    }

    $compiled_js = '/assets/dist/main.js';
    if (file_exists(get_template_directory() . $compiled_js)) {
        wp_enqueue_script(
            '{{THEME_SLUG}}-main',
            get_template_directory_uri() . $compiled_js,
            [],
            {{PHP_PREFIX}}_asset_version($compiled_js),
            true
        );
    }
}
add_action('wp_enqueue_scripts', '{{PHP_PREFIX}}_enqueue_assets');
