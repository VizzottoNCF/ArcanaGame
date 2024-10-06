/// @description menu stuff
// get inputs
up_key = global.key_up_pressed
down_key = global.key_down_pressed
accept_key = global.key_action_pressed

// store number of options in current menu
op_length = array_length(option[menu_level])

// move through menu
pos += down_key - up_key

if pos >= op_length {pos = 0} // goes from last to first option
if pos < 0 {pos = op_length-1} // goes from first to last option
	
	
	// use mouse to move through menu
	for (var i = 0; i < array_length(option[menu_level]); i++)
	{
		var _xx = x + op_border
		var _yy = y + op_border + op_space * i
	
		var _text_width = string_width(option[menu_level,i])
		var _text_height = string_height(option[menu_level, i]) 
	
		var _inside = mouse_x > _xx  && mouse_x < _xx + _text_width && mouse_y > _yy && mouse_y < _yy + _text_height
	
		if _inside {pos = i}
	
	}

// using the options
if (accept_key)
{
	
	var _sml = menu_level // _sml = start menu level
	
	switch(menu_level)
	{
		// Start Menu
		case 0:
			switch(pos)
			{
				// Start Game
				case 0: room_goto(rm_Demo1); break;
				// Settings
				case 1: menu_level = 1; break;
				// Quit Game
				case 2:	game_end(); break;
			}
			break;
		
		// Settings Menu
		case 1:
			switch(pos)
			{
				// Window Size
				case 0: /*room_goto()*/ break;
				// Brigthness
				case 1: menu_level = 2; break;
				// Controls
				case 2:	menu_level = 3; break;
				// Language
				case 3:	menu_level = 4; break;
				// Back
				case 4:	menu_level = 0; break;
			}
		
		// Brightness
		case 2:
	}
	
	// set position back
	if _sml != menu_level {pos = 0}
	
	// correct option length
	op_length = array_length(option[menu_level])
}