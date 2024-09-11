/// @description Follow Player



#region Camera tracking
if (follow != noone)
{
	#region Limitações Horizontais
	if (CameraLimitX == "Muro")
	{
		
	}
	#endregion
	#region Camera Normal Horizontal
	else
	{
		if (follow.bbox_left > camWidth*0.5 && follow.bbox_right < room_width-camWidth*0.5)
		{
			xTo = follow.x
			
			//horizontally free
			h_bound = false
		}
		else
		{
			//horizontally bound
			h_bound = true
			
			// sets camera boundaries for right side and left side	
			if (follow.x > room_width/2)
			{
				xTo = room_width-camWidth*0.5
			}
			else if (follow.x < room_width/2)
			{
				xTo = camWidth*0.5
			}
		}
	}
	#endregion
	#region Limitações Verticais
	if (CameraLimitY == "Muro")
	{
		if (follow.bbox_top > 1120+camHeight*0.5 && follow.bbox_bottom < room_height-camHeight*0.5)
		{
			yTo = follow.y
			
			//vertically free
			v_bound = false
		}
		else
		{
			//vertically bound
			v_bound = true
			
			// sets camera boundaries for up and down
			
			if (follow.y < (room_height-1120)/2+1120) 
			{
				yTo = 1120+camHeight*0.65
			}
			else if (follow.y > (room_height-1120)/2+1120) 
			{
				yTo = room_height-camHeight*0.5
			}
		}
	}
	#endregion
	#region Camera Normal Vertical
	else
	{
		if (follow.bbox_top > camHeight*0.5 && follow.bbox_bottom < room_height-camHeight*0.5)
		{
			yTo = follow.y	
			//show_debug_message("Vertical Normal")
			//vertically free
			v_bound = false
		}
		else
		{
			//vertically bound
			v_bound = true
			
			// sets camera boundaries for up and down
			
			if (follow.y < room_height/2) 
			{
				//show_debug_message("Vertical Bound UP")
				yTo = camHeight*0.5
			}
			else if (follow.y > room_height/2)
			{
				//show_debug_message("Vertical Bound DOWN")
				yTo = room_height-camHeight*0.5
			}
		}
	}
	#endregion
}

#endregion



// Stops camera in case textbox spawns so text doesn't get messed up
if (!instance_exists(obj_textbox))
{
	x = xTo
	y = yTo
}


// Sets camera position to point at view object
camera_set_view_pos(view_camera[0], x-(camWidth*0.5), y - (camHeight*0.5))

