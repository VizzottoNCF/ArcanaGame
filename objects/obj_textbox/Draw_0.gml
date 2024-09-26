var cam_id = room_get_camera(room, 0)

var _offsetX = camera_get_view_width(cam_id)/4
var _offsetY = camera_get_view_height(cam_id)/4
var _textOffset = camera_get_view_width(cam_id)*15/100
//show_message(_textOffset) 


textbox_x = camera_get_view_x(view_camera[0]) + _offsetX;
textbox_y = camera_get_view_y(view_camera[0]) + _offsetY;

//------------setup--------------//
if setup == false
{
	setup = true
	draw_set_font(global.font_medium)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	
	for(var p = 0; p < page_number; p++) // p = page
	{	
	//----------ver quantos caracteres tem no "text_length" array---------//
		text_length[p] = string_length(text[p])
		
		//pegar a posicao x para a textbox 
		//sem personagem
		text_x_offset[p] = sign(_textOffset)
		
		// loop through characters
		for (var c = 0; c < text_length[p]; c++) // c = character
		{
			var _char_pos = c+1
			
			// sore individual characters in array for specific vfx to each 
			char[c, p] = string_char_at(text[p], _char_pos)
			
			// get current width of line
			var _txt_up_to_char = string_copy(text[p], 1, _char_pos)
			var _current_text_w = string_width(_txt_up_to_char) - string_width(char[c,p])
			
			// get the last free space
			if (char[c,p] == " ")
			{
				last_free_space = _char_pos+1 // in case line breaks is with space character
			}
			
			// get line breaks
			if (_current_text_w - line_break_offset[p] > line_width)
			{
				line_break_pos[line_break_num[p], p] = last_free_space
				line_break_num[p]++
				var _txt_up_to_last_space = string_copy(text[p], 1, last_free_space)
				var _last_free_space_string = string_char_at(text[p], last_free_space)
				line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string)
			}
		}
		//getting each character coordinates
		for (var c = 0; c < text_length[p]; c++)
		{
			var _char_pos = c+1
			var _text_X = textbox_x + text_x_offset[p] + border
			var _text_Y = textbox_y + border
			// get current width of line
			var _txt_up_to_char = string_copy(text[p], 1, _char_pos)
			var _current_text_w = string_width(_txt_up_to_char) - string_width(char[c,p])
			var _txt_line = 0
			
			// compensate for string breaks
			for (var lb = 0; lb <line_break_num[p]; lb++)
			{
				if (_char_pos >= line_break_pos[lb, p])
				{
					var _str_copy = string_copy(text[p], line_break_pos[lb,p], _char_pos-line_break_pos[lb,p]) 
					_current_text_w = string_width(_str_copy)
					
					// record the "line" this character should be on
					_txt_line = lb+1
				}
			}
			
			//add to the x and y coordinates based on the new info
			char_x[c,p] = _text_X + _current_text_w
			char_y[c,p] = _text_Y + _txt_line*line_sep
		}
	}
}

//-------------------write text-----------------------------//
if (text_pause_timer <= 0)
{
	if (draw_char < text_length[page])
	{
		draw_char += text_spd
		draw_char = clamp(draw_char, 0, text_length[page])
		var _check_char = string_char_at(text[page], draw_char)
		if (_check_char == "," || _check_char == ".")
		{
			text_pause_timer = text_pause_time
		}
		else
		{
			// typing sound
			if (snd_count < snd_delay)
			{
				snd_count++
			}
			else
			{
				snd_count = 0
				audio_sound_pitch(snd[page], random_range(0.5, 1))
				audio_play_sound(snd[page], 1, false)
			}
		}
	}
}
else
{
	text_pause_timer--
}
	
// counter for fast page flipping (starts at 0)
time_since_page_start++

//-------------------flip through pages-------------------//
if (global.key_action_pressed && time_since_page_start > 1)
{
	
	time_since_page_start = 0 // restarts counter
	
	
	// check if text was already drawn
	if (draw_char == text_length[page])
	{
		
		// next page
		if (page < page_number - 1)
		{
			page++;
			draw_char = 0
		}
		// destroy textbox
		else 
		{
			//link text for options
			if (option_number > 0)
			{
				gf_create_textbox(option_link_id[option_pos])
			}
			instance_destroy()
		}
	}
	
	else 
	{
		draw_char = text_length[page]
	}
	
}
//------------------------draw textbox------------------------//

var _txtb_x = textbox_x + text_x_offset[page]
var _txtb_y = textbox_y
txtb_img += txtb_img_spd
txtb_spr_w = sprite_get_width(txtb_spr)
txtb_spr_h = sprite_get_height(txtb_spr)

// back of textbox
draw_sprite_ext(txtb_spr, txtb_img, _txtb_x, _txtb_y, textbox_width / txtb_spr_w, textbox_heigth / txtb_spr_h, 0, c_white, 1)


//------------------options-------------------//
if (draw_char == text_length[page] && page == page_number -1)
{
	// option pos
	option_pos += mouse_wheel_down() - mouse_wheel_up()
	
	option_pos = clamp(option_pos, 0, option_number-1)
	
	// draw options
	var _op_space = 40;
	var _op_board = 20;
	for (var op = 0; op < option_number; op++)
	{
		// option box
		var _op_width = string_width(option[op]) + _op_board*2;
		draw_sprite_ext(txtb_spr, txtb_img, _txtb_x + 50, _txtb_y - _op_space * option_number + _op_space*op, _op_width/txtb_spr_w, (_op_space -1)/txtb_spr_h,0,c_white,1)
		
		// option selected
		if (option_pos == op)
		{
			draw_sprite(spr_optionPointer, 0, _txtb_x, _txtb_y - _op_space * option_number + _op_space*op)
		}
		
		
		/*option_text_length = string_length(option[op])
		
		for (var c = 0; */
		
		// option text
		draw_text(_txtb_x + 50 + _op_board, _txtb_y - _op_space * option_number + _op_space * op + 2, option[op])
	}
}

// draw text
for (var c = 0; c < draw_char; c++)
{
	// special effects
	//transform text
	var _angle = 1 //makes letters bigger
	var _x_scale = 1 //will make letters closer together
	var _y_scale = 0 
	if (big_text[c, page] == true)
	{
		var _angle = 2
	}
	
	//shake text
	var _shake_x = 0
	var _shake_y = 0
	if (shake_text[c,page] == true)
	{
		shake_timer[c,page]--
		if (shake_timer[c,page] <= 0)
		{
			shake_timer[c,page] = irandom_range(4,8)
			shake_dir[c,page] = irandom(360)
		}
		_shake_x = lengthdir_x(1, shake_dir[c,page])
		_shake_y = lengthdir_y(1, shake_dir[c,page])
	}
	
	//floating text
	var _float_y = 0
	if (float_text[c,page] == true)
	{
		float_dir[c,page] += -14
		_float_y = dsin(float_dir[c,page])*3
	}
	
	//the text
	draw_text_transformed_color(char_x[c,page] + _shake_x, char_y[c, page] + _float_y + _shake_y, char[c, page], _x_scale, _angle, _y_scale, col_1[c, page],  col_2[c, page], col_3[c, page], col_4[c, page], 1)
}