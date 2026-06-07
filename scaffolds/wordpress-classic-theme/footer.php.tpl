<?php
/**
 * Site footer.
 *
 * @package {{THEME_SLUG}}
 */
?>

<footer class="site-footer">
    <div class="site-footer__inner">
        <p>
            <?php
            printf(
                esc_html__('Copyright %1$s %2$s.', '{{TEXT_DOMAIN}}'),
                esc_html(gmdate('Y')),
                esc_html(get_bloginfo('name'))
            );
            ?>
        </p>
    </div>
</footer>

<?php wp_footer(); ?>
</body>
</html>
