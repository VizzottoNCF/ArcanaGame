/// @description draw inventory

for (var i = 0; i < array_length(inv); i++)
{
	var _xx = screen_bord
	var _yy = screen_bord
	var _sep = sep
	var _col = c_white
	
	draw_sprite(inv[i].icon, image_index div 8, _xx, _yy + _sep*i)
	
	if selected_item == i {_col = c_yellow}
	draw_set_color(_col)
	
	draw_text(_xx + 16, _yy - 32 + _sep*i, inv[i].name)
	
	draw_set_color(c_white)
}
