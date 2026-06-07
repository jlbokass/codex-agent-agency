<?php
/**
 * Template tags.
 *
 * @package {{THEME_SLUG}}
 */

declare(strict_types=1);

if (! defined('ABSPATH')) {
    exit;
}

function {{PHP_PREFIX}}_posted_on(): void
{
    $time_string = sprintf(
        '<time class="entry-date published" datetime="%1$s">%2$s</time>',
        esc_attr(get_the_date(DATE_W3C)),
        esc_html(get_the_date())
    );

    printf(
        '<div class="entry-meta">%s</div>',
        wp_kses_post($time_string)
    );
}
