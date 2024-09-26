// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gf_basic_shadow()
{
	
	// draws angular shadow
	
	if (instance_exists(obj_Light_Source_parent) && distance_to_object(instance_nearest(x, y, obj_Light_Source_parent)) <= 150)
	{
		var _direction = point_direction(x,y, obj_Light_Source_parent.x, obj_Light_Source_parent.y)
		var _offset_x = lengthdir_x(100, _direction)
		var _offset_y = lengthdir_y(100, _direction)
	}
	else
	{
		var _offset_x = 5 //(room_width/2)-mouse_x // default 5
		var _offset_y = 2 // (room_height/2)-mouse_y // default 10
	}
	
	// top-left corner
	var _x1 = x-(sprite_width/2) - _offset_x
	var _y1 =  y - _offset_y
	
	// top-right corner
	var _x2 = x+(sprite_width/2)- _offset_x
	var _y2 = y - _offset_y
	
	// bot-right corner
	var _x3 = x+(sprite_width/3)
	var _y3 = y
	
	// bot-left corner
	var _x4 = x-(sprite_width/3)
	var _y4 = y
	
	
	gpu_set_fog(true, c_purple, 0, 1) //make it so shadow is colorful
	
	draw_sprite_pos(sprite_index, image_index, _x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, 1)
	
	gpu_set_fog(false, c_white, 0, 1) //make it so rest is drawn with intended colors	
	
	//draw_self() // draws original sprite on top of shadows
}