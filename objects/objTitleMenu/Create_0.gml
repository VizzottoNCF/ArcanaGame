/// @description definir var

width = 64 //temp fix later
height = 104 //temp fix later

op_border = 8 //temp fix later
op_space = 24 //temp fix later


pos = 0 // highlight and select options

mouse_select_x[0] = 0
mouse_select_y[0] = 0


// Start Menu
option[0, 0] = "Start Game"
option[0, 1] = "Settings"
option[0, 2] = "Quit Game"

// Settings Menu
option[1, 0] = "Window Size"
option[1, 1] = "Brightness"
option[1, 2] = "Controls"
option[1, 3] = "Language"
option[1, 4] = "Back"

// Brightness

op_length = 0
menu_level = 0


if (font_exists(global.font_medium)) {draw_set_font(global.font_medium)} else{draw_set_font(fn_Lilita)}

