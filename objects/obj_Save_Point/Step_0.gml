/// @description 

image_angle++

var _s = id.text_id

if (distance_to_object(obj_Player_Hitbox)<= 64)
{
	if (_s != "0")
	{
		if (global.key_action_pressed && !instance_exists(obj_textbox))
		{
			with (instance_create_depth(0,0,-999999,obj_textbox))
			{
				//checks instance_id to send different dialogs with different instances of same object
				gf_game_text(_s)
			}
		}
	}
}
