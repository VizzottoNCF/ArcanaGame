/// @description draw inventory
if inventory_open
{
	for (var i = 0; i < array_length(inv); i++)
	{
		var _xx = screen_bord
		var _yy = screen_bord
		var _sep = sep
		var _col = c_white
	
		// draw icon
		draw_sprite(inv[i].icon, image_index div 8, _xx, _yy + _sep*i)
	
	
		// get selected color
		if selected_item == i {_col = c_yellow}
		draw_set_color(_col)
	
		// draw name
		draw_text(_xx + 16, _yy - 32 + _sep*i, inv[i].name)
	
		// reset color
		draw_set_color(c_white)
	
		// description
		if selected_item == i {draw_text_ext(_xx+16, _yy + _sep * array_length(inv), inv[i].desc, 12, 80)}
	}
}