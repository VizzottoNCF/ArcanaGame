
if (global.key_pause_single_pressed) {inventory_open = !inventory_open}

if (inventory_open)
{
	// get selected item
	selected_item = -1

	for (var i = 0; i < array_length(inv); i++)
	{
		var _xx = screen_bord
		var _yy = screen_bord + sep * i
		var _sep = sep
		var _icon_width = 64
		var _icon_height = 64
	
		if mouse_x > _xx-_icon_width/2 && mouse_x < _xx+_icon_width/2 && mouse_y > _yy-_icon_height && mouse_y < _yy
		{
			selected_item = i
		}
		draw_set_color(c_white)
		draw_rectangle(_xx, _xx+_icon_width, _yy, _yy+_icon_height, false)
	}
	
	
	if selected_item != -1
	{
	
		// use item
		if mouse_check_button_pressed(mb_left) // substitute for global later
		{
			inv[selected_item].effect()
		}
	}
	
	
	
}