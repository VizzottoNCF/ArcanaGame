setup = false

//Textbox
var cam_id = room_get_camera(room, 0)

textbox_width = camera_get_view_width(cam_id)*40/100
textbox_heigth = camera_get_view_height(cam_id)*30/100

border = (camera_get_view_height(cam_id)*5/100); // space between txtbox and text
line_sep = 30 // space between letters
line_width = textbox_width - border*2

txtb_spr = sTextboxFrame
txtb_img= 0
txtb_img_spd = 6/60

//Texto
page = 0 // page of dialogue
page_number = 0

text[0] = "" // string for text page, array for multiple pages
text_length[0] = string_length(text[0])

draw_char = 0 // typewriter effect
text_spd = 1

char[0,0] = ""
char_x[0,0] = 0
char_y[0,0] = 0

//Options
option[0] = "" // string for option text
option_link_id[0] = -1 // links to differing texts
option_pos = 0
option_number = 0

option_text_length = string_length(option[0])


if (setup != false) {setup = false}

//Sound
snd_delay = 5
snd_count = snd_delay

// VFX
scr_set_default_texts()
last_free_space = 0
text_pause_timer = 0
text_pause_time = 16


// Debug

time_since_page_start = 0 // be able to jump to next page (fix bug for insta page switch)


if (font_exists(global.font_medium))
{
	//show_debug_message("Font exists")
	draw_set_font(global.font_medium)
}
else
{
	//show_debug_message("Font does not exist")
	draw_set_font(fn_Lilita)
}



