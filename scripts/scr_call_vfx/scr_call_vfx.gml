function gf_basic_shadow()
{
	// draws angular shadow
	if (instance_exists(obj_Light_Source_parent) && distance_to_object(instance_nearest(x, y, obj_Light_Source_parent)) <= obj_Light_Source_parent.light_reach)
	{
		
		var _light_intensity = obj_Light_Source_parent.light_reach - distance_to_object(instance_nearest(x,y, obj_Light_Source_parent))
		
		var _direction = point_direction(x,y, obj_Light_Source_parent.x, obj_Light_Source_parent.y)
		target_offset_x = lengthdir_x(_light_intensity, _direction)
		target_offset_y = lengthdir_y(_light_intensity, _direction)
	}
	else
	{
		// default values
		target_offset_x = 2
		target_offset_y = 2
	}
	
	// Interpolate between current and target offsets
    current_offset_x = lerp(current_offset_x, target_offset_x, 0.07)
    current_offset_y = lerp(current_offset_y, target_offset_y, 0.07)
	
	
	// top-left corner
	var _x1 = x-(sprite_width/2) - current_offset_x
	var _y1 =  y - current_offset_y
	
	// top-right corner
	var _x2 = x+(sprite_width/2) - current_offset_x
	var _y2 = y - current_offset_y
	
	// bot-right corner
	var _x3 = x+(sprite_width/3)
	var _y3 = y
	
	// bot-left corner
	var _x4 = x-(sprite_width/3)
	var _y4 = y
	
	
		
	gpu_set_fog(true, c_purple, 0, 1) //make it so shadow is colorful
	draw_sprite_pos(sprite_index, image_index, _x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, 0.3)
	
	gpu_set_fog(false, c_white, 0, 1) //make it so rest is drawn with intended colors	
}





