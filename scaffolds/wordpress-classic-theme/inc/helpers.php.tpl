<?php
/**
 * Small presentation helpers.
 *
 * @package {{THEME_SLUG}}
 */

declare(strict_types=1);

if (! defined('ABSPATH')) {
    exit;
}

function {{PHP_PREFIX}}_has_excerpt(): bool
{
    return has_excerpt() || trim((string) get_the_excerpt()) !== '';
}

function {{PHP_PREFIX}}_read_more_label(): string
{
    return esc_html__('Read more', '{{TEXT_DOMAIN}}');
}
