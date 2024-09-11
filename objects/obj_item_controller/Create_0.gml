depth = -99999999999

// item constructor
function create_item(_name, _icon) constructor
{
	
	name = _name
	icon = _icon
	
}



// create the items
global.item_inv = 
{
	#region hats

	Apprentice_hat : new create_item(
		"Apprentice's Hat",
		spr_hat_blue_idle_down // sub for actual icon later
	),

	
	#endregion
	
	#region capes
	
	Apprentice_cape : new create_item(
		"Apprentice's Cape",
		spr_cape_blue_idle_down // sub for actual icon later
	),
	
	#endregion
	
	#region staffs
	
	Apprentice_staff : new create_item(
		"Apprentice's Staff",
		spr_cape_blue_idle_down // sub for actual icon later
	),
	
	#endregion
	
	#region key items
	#endregion
}

// create the inventory
inv = array_create(0) //inventory array

	/// !!!! TEMPORARY !!!!
	// place items in inventory array
	//array_push(inv, global.item_inv.Apprentice_hat)
	//array_push(inv, global.item_inv.Apprentice_cape)
	
	

// draw + mouse position
sep = 64
screen_bord = 64