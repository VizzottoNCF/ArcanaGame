///@desc draw inventory

depth = -99999999999


inventory_open = false




// item constructor
function create_item(_name, _icon, _desc, _effect) constructor
{
	
	name = _name
	icon = _icon
	desc = _desc
	effect = _effect
}



// create the items
global.item_inv = 
{
	#region hats

	Apprentice_hat : new create_item(
		"Apprentice's Hat",
		spr_hat_blue_idle_down, // sub for actual icon later,
		"An important gift",
		function()
		{
			global.hat_equipped = "Blue"
			update_player_stat_bonus()
		}
	),

	
	#endregion
	
	#region capes
	
	Apprentice_cape : new create_item(
		"Apprentice's Cape",
		spr_cape_blue_idle_down, // sub for actual icon later
		"An important gift",
		function()
		{
			global.cape_equipped = "Blue"
			update_player_stat_bonus()
		}
	),
	
	#endregion
	
	#region staffs
	
	Apprentice_staff : new create_item(
		"Apprentice's Staff",
		spr_cape_blue_idle_down, // sub for actual icon later
		"An important gift",
		function()
		{
			global.staff_equipped = "Starter"
			update_player_stat_bonus()
		}
		),
	
	#endregion
	
	#region key items
	#endregion
}

// create the inventory
inv = array_create(0) //inventory array

selected_item = -1 // item selected for use with mouse
	

// draw + mouse position
sep = 64
screen_bord = 64


