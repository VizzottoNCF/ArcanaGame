if (font_exists(global.font_medium)) {
    font_delete(global.font_medium)
} else {
    show_debug_message("Font does not exist: global.font_medium");
}