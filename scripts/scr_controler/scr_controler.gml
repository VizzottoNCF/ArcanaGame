// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//
//
// global controler script by shoyos ver240827
// added action key pressed
// discovered 1 frame delay on using step , changed callof gf_global_controler to begin step to fix


randomize()


////DEV FUNCTIONS

function gf_dev_functions(_type)
{
	switch(_type)
	{
		case 0: // GOD MODE
			break;
	}
}

#region variables declaration
	gf_global_controller_var_declaration()
#endregion

#region !!!!USE THESE !!!!function to get keys states
	//////////////////////////////////
	function gf_get_key_up_state()
	{
		return global.key_up
	}
	function gf_get_key_down_state()
	{
		return global.key_down
	}
	function gf_get_key_left_state()
	{
		return global.key_left
	}
	function gf_get_key_right_state()
	{
		return global.key_right
	}	
	//////////////////////////////////////
	function gf_get_key_action_state()
	{
		return global.key_action
	}
	function gf_get_key_action_pressed_state()
	{		
		return global.key_action_pressed
	}
	function gf_get_key_jump_state()
	{
		return global.key_jump
	}
	function gf_get_key_jump_pressed_state()
	{
		return global.key_jump_pressed
	}
	function gf_get_key_item_state()
	{
		return global.key_item
	}
	function gf_get_key_pause_single_state()
	{
		return global.key_pause_single_pressed
	}
	////////////////////////////////////////////////
	function gf_get_key_up_pressed_state()
	{
		return global.key_up_pressed
	}
	function gf_get_key_down_pressed_state()
	{
		return global.key_down_pressed
	}
	function gf_get_key_left_pressed_state()
	{
		return global.key_left_pressed
	}
	function gf_get_key_right_pressed_state()
	{
		return global.key_right_pressed
	}
	
	function gf_get_key_any_pressed_state()
	{
		return keyboard_check_pressed(vk_anykey)
	}
	
	///////////////////////////////////////////////
#endregion


#region !!!! CALL THIS FUNCTION ON A OBJECT CONTROLER ON BEGIN STEP EVENT!!! global control per frame to get inputs (use begin step)
function gf_global_controller()
{
	#region //gambiarra to make controler work
	global.GP_NUM = -1 //try to detect controler 
	for (var i = 0; i < gamepad_get_device_count(); i++) {

	   if gamepad_is_connected(i) {

		   global.GP_NUM = i
			//show_debug_message(i)
	   }
	}
	#endregion
	
	global.key_up =		keyboard_check(vk_up)		|| keyboard_check(ord("W")) || (gamepad_axis_value(global.GP_NUM,gp_axislv)<-0.1)	|| global.key_touch_up_detected
	global.key_down =	keyboard_check(vk_down)		|| keyboard_check(ord("S")) || (gamepad_axis_value(global.GP_NUM,gp_axislv) > 0.1)	|| global.key_touch_down_detected
	global.key_left =	keyboard_check(vk_left)		|| keyboard_check(ord("A")) || (gamepad_axis_value(global.GP_NUM,gp_axislh)<-0.1)	|| global.key_touch_left_detected
	global.key_right =	keyboard_check(vk_right)	|| keyboard_check(ord("D")) || (gamepad_axis_value(global.GP_NUM ,gp_axislh)>0.1)	|| global.key_touch_right_detected
	

	global.key_action = keyboard_check(ord("X")) || keyboard_check(ord("B"))   || gamepad_button_check(global.GP_NUM, gp_face4) || global.key_touch_action_detected // TOP BUTTON
	global.key_jump =   keyboard_check(ord("Z")) || keyboard_check(vk_numpad0) || gamepad_button_check(global.GP_NUM, gp_face1) || global.key_touch_jump_detected // BOTTOM BUTTON
	global.key_item =   keyboard_check(ord("C")) || keyboard_check(ord("N"))   || gamepad_button_check(global.GP_NUM, gp_face3) // LEFT BUTTON 
	//gp_paddlel
	
	global.key_pause_single_pressed = keyboard_check_pressed(ord("P"))//|| gamepad missing
	
		#region key pressed rework fiddled with key pressed to be universal for controler
			////////////////////////
			#region key jump
	
			if ( global.key_jump == 1 && global.key_jump_last_detected == 1) 
			{
				global.key_jump_pressed=0
		
			}	
			if( global.key_jump == 1 && global.key_jump_last_detected == 0)
			{
				global.key_jump_pressed = 1
				global.key_jump_last_detected = 1
		
			} 
			if (global.key_jump == 0) 
			{
				global.key_jump_pressed = 0
				global.key_jump_last_detected = 0
			}
			#endregion
			////////////////////////
			#region key action	
			if ( global.key_action == 1 && global.key_action_last_detected == 1) 
			{
				global.key_action_pressed=0
		
			}	
			if( global.key_action == 1 && global.key_action_last_detected == 0)
			{
				global.key_action_pressed = 1
				global.key_action_last_detected = 1
		
			} 
			if (global.key_action == 0) 
			{
				global.key_action_pressed = 0
				global.key_action_last_detected = 0
			}
			#endregion
			////////////////////////
			#region key up	
			if ( global.key_up == 1 && global.key_up_last_detected == 1) 
			{
				global.key_up_pressed=0
		
			}	
			if( global.key_up == 1 && global.key_up_last_detected == 0)
			{
				global.key_up_pressed = 1
				global.key_up_last_detected = 1
		
			} 
			if (global.key_up == 0) 
			{
				global.key_up_pressed = 0
				global.key_up_last_detected = 0
			}
			#endregion
			////////////////////////
			#region key down
			if ( global.key_down == 1 && global.key_down_last_detected == 1) 
			{
				global.key_down_pressed=0
		
			}	
			if( global.key_down == 1 && global.key_down_last_detected == 0)
			{
				global.key_down_pressed = 1
				global.key_down_last_detected = 1
		
			} 
			if (global.key_down == 0) 
			{
				global.key_down_pressed = 0
				global.key_down_last_detected = 0				
			}
			#endregion
			////////////////////////
			#region key left	
			if ( global.key_left == 1 && global.key_left_last_detected == 1) 
			{
				global.key_left_pressed=0
		
			}	
			if( global.key_left == 1 && global.key_left_last_detected == 0)
			{
				global.key_left_pressed = 1
				global.key_left_last_detected = 1
		
			} 
			if (global.key_left == 0) 
			{
				global.key_left_pressed = 0
				global.key_left_last_detected = 0
			}
			#endregion
			////////////////////////
			#region key right
			if ( global.key_right == 1 && global.key_right_last_detected == 1) 
			{
				 global.key_right_pressed=0
		
			}	
			if( global.key_right == 1 &&  global.key_right_last_detected == 0)
			{
				global.key_right_pressed = 1
				global.key_right_last_detected = 1
		
			} 
			if (global.key_right == 0) 
			{
				global.key_right_pressed = 0
				global.key_right_last_detected = 0
			}
			#endregion
			////////////////////////
			
			
	
			///////
			
		#endregion
		gf_controller_touch_set_reset_keys()
	
}
#endregion 






function gf_global_controller_var_declaration()
{

	
#region variables declaration
	
	if (!variable_global_exists("controller_initialized"))
	{
	
		global.controller_initialized=true
		
		///////////////////////// !!!!!!!!!!!! TURN OFF LATER
		global.dev_functions = false
		/////////////////////////
		
		global.GP_NUM = -1

		global.key_up = 0
		global.key_down = 0
		global.key_left = 0
		global.key_right = 0
	
		global.key_action = 0
		global.key_jump = 0
		global.key_item = 0
	
		global.key_pause_single_pressed = 0  //single pressed is meant cuz it dont have the normal key (continual )state
		
		//pressed
		//action pressed
		global.key_action_pressed = 0
		global.key_action_last_detected = 0
		
		//jump pressed
		global.key_jump_pressed = 0
		global.key_jump_last_detected = 0
		
		//up pressed
		global.key_up_pressed = 0
		global.key_up_last_detected = 0
		
		//down pressed
		global.key_down_pressed = 0
		global.key_down_last_detected = 0
		
		//right pressed
		global.key_right_pressed = 0
		global.key_right_last_detected = 0
		
		//left pressed
		global.key_left_pressed = 0
		global.key_left_last_detected = 0
		
		//touch screen control test
		gf_controller_touch_set_reset_keys()
		//end touch screen control test
	}
#endregion 



}


function gf_controller_touch_set_reset_keys()
{
	global.key_touch_up_detected = 0
	global.key_touch_down_detected = 0
	global.key_touch_left_detected = 0
	global.key_touch_right_detected = 0
		
	global.key_touch_action_detected = 0
	global.key_touch_jump_detected = 0
}


function gf_key_touch_detected(slv_SGE_TOUCH_DETECTED)
{
	
	if(slv_SGE_TOUCH_DETECTED==SGE_TOUCH_DETECTED.UP)			global.key_touch_up_detected = 1	
	else if(slv_SGE_TOUCH_DETECTED==SGE_TOUCH_DETECTED.DOWN)	global.key_touch_down_detected = 1
	else if(slv_SGE_TOUCH_DETECTED==SGE_TOUCH_DETECTED.LEFT)	global.key_touch_left_detected = 1
	else if(slv_SGE_TOUCH_DETECTED==SGE_TOUCH_DETECTED.RIGHT)	global.key_touch_right_detected = 1
		
	else if(slv_SGE_TOUCH_DETECTED==SGE_TOUCH_DETECTED.ACTION)		global.key_touch_action_detected = 1
	else if(slv_SGE_TOUCH_DETECTED==SGE_TOUCH_DETECTED.JUMP)		global.key_touch_jump_detected = 1
}
