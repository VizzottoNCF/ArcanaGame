#region STATUS

function spdate_player_status_bonus()
{
	
	player_calc_status()
	
	/// MANA
	
	global.mana_max = 5 +  obj_Equipment_Controller.extra_mana
	
	/// HEALTH
	
	global.health_max = 3 + obj_Equipment_Controller.extra_life
	
	/// DAMAGE
}

function player_calc_status()
{
	#region reset stats
	obj_Equipment_Controller.extra_life = 0
	obj_Equipment_Controller.extra_mana = 0

	obj_Equipment_Controller.extra_damage = 0
	obj_Equipment_Controller.extra_fire_damage = 0
	obj_Equipment_Controller.extra_lighting_damage = 0
	obj_Equipment_Controller.extra_healing = 0
	#endregion
	
	#region CLOTHES
	if global.cape_equipped == "Blue" || global.hat_equipped == "Blue"
	{
		obj_Equipment_Controller.extra_life += 2
		obj_Equipment_Controller.extra_mana += 2		
	}
	if global.cape_equipped == "Gold" || global.hat_equipped == "Gold"
	{
		obj_Equipment_Controller.extra_life += 0
		obj_Equipment_Controller.extra_mana += 0		
	}
	#endregion
	
	
	#region STAVES
	if global.staff_equipped == "Starter"
	{
		obj_Equipment_Controller.extra_mana += 3
	}
	#endregion
}

#endregion

#region SPELLS
function scr_fireball_spell_attack()
{

}

function scr_ice_pillar_spell_attack()
{
	
}

function scr_blink_spell()
{
	
	//var _length = 200
	//if gamepad_get_device_count != 0 && gamepad_is_connected(global.GP_NUM)
	//{
		
	//}
	//else
	//{
	//	var _dir = point_direction(x,y, mouse_x, mouse_y)
	//	lengthdir_x(_length, _dir)
	//	lengthdir_y(_length, _dir)
	//}
}

function scr_lightning_bolt_spell_attack()
{
}
#endregion 