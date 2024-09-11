/// @description Camera Settings + Data
// Grabs Camera ID
var cam_id = room_get_camera(room, 0)

// Extracts Width and Height from Camera Property

view_wview[0] = camera_get_view_width(cam_id)
view_hview[0] = camera_get_view_height(cam_id)


if (instance_exists(player_data_carrier))
{
	targetEnter = player_data_carrier.targetEnter
	
	instance_destroy(player_data_carrier)
	
	// Snap coords to target Enter
	if (instance_exists(targetEnter))
	{
		x = targetEnter.x
		y = targetEnter.y
	}
}