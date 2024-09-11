// text VFXs
function scr_set_default_texts()
{
	line_break_pause[0, page_number] = 999
	line_break_num[page_number] = 0
	line_break_offset[page_number] = 0
	snd[page_number] = snd_typeText
	
	// varaibles for every letter/character
	for (var c = 0; c < 500; c++)
	{
		col_1[c, page_number] = c_white
		col_2[c, page_number] = c_white
		col_3[c, page_number] = c_white
		col_4[c, page_number] = c_white
		
		float_text[c,page_number] = 0  //is text floating
		float_dir[c,page_number] = c * 20 // grabs y direction for floating
		
		shake_text[c, page_number] = 0 //is text shaking
		shake_dir[c, page_number] = irandom(360) // random angle to shake
		shake_timer[c, page_number] = irandom(4) // shake every 4 frames
		
		big_text[c, page_number] = 0 //is text big?
	}
	
}

// TEXT VFX
///@param start 1st character with effect
///@param end last character with effect
///@param col1 1st quadrant color
///@param col2 2nd quadrant color
///@param col3 3rd quadrant color
///@param col4 4th quadrant color
function scr_text_color(_start, _end, _col1, _col2, _col3, _col4)
{
	// every letter default
	for (var c = _start; c <= _end; c++)
	{
		col_1[c, page_number-1] = _col1
		col_2[c, page_number-1] = _col2
		col_3[c, page_number-1] = _col3
		col_4[c, page_number-1] = _col4
	}
}

///@param start 1st character with effect
///@param end last character with effect
function scr_text_float(_start, _end)
{
	for (var c = _start; c <= _end; c++)
	{
		float_text[c, page_number-1] = true
	}
}

///@param start 1st character with effect
///@param end last character with effect
function scr_text_shake(_start, _end)
{
	for (var c = _start; c <= _end; c++)
	{
		shake_text[c, page_number-1] = true
	}
}


///@param start 1st character with effect
///@param end last character with effect
function scr_text_big(_start, _end)
{
	for (var c = _start; c <= _end; c++)
	{
		big_text[c, page_number-1] = true
	}
}



///@param text what is to be written in text
///@param character determines voice sound
function gf_text(_text)
{
	scr_set_default_texts()
	text[page_number] = _text
	
	if (argument_count > 1)
	{
		switch (argument[1])
		{
			default:
				snd[page_number] = snd_typeText
				break;
				
			//case "Alarme":
			//	snd[page_number] = snd_blank
			//	break;
		}
	}
	
	page_number++
}


///@param text_id
function gf_create_textbox(_text_id)
{
	with (instance_create_depth(0, 0, -9999, obj_textbox))
		{
			
			 gf_game_text(_text_id)
		}	
}

///@param option_text written in textbox
///@param linking_text_id what text instanec it'll lead to
function gf_option(_option, _link_id)
{
	option[option_number] = _option;
	option_link_id[option_number] = _link_id
	
	option_number++
}

