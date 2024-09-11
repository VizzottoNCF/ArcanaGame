/// @description draw inventory

for (var i = 0; i < array_length(inv); i++)
{
	var _xx = screen_bord
	var _yy = screen_bord
	var _sep = sep
	
	draw_sprite(inv[i].icon, image_index div 8, _xx, _yy + _sep*i)
	
	draw_text(_xx + 16, _yy - 32 + _sep*i, inv[i].name)
	
	
}
