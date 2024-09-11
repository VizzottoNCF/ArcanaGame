/// @description finds colour
switch(global.cape_equipped)
{
	////////////////////////////////////////////////////////
	// BLUE
	default:
		// idle
		global.spr_PlayerCape_idle_up = spr_cape_blue_idle_up
		global.spr_PlayerCape_idle_down = spr_cape_blue_idle_down
		global.spr_PlayerCape_idle_left = spr_cape_blue_idle_left
		global.spr_PlayerCape_idle_right = spr_cape_blue_idle_right

		// walk
		global.spr_PlayerCape_walk_up = spr_cape_blue_walk_up
		global.spr_PlayerCape_walk_down = spr_cape_blue_walk_down
		global.spr_PlayerCape_walk_left = spr_cape_blue_walk_left
		global.spr_PlayerCape_walk_right = spr_cape_blue_walk_right
		break;
		
	////////////////////////////////////////////////////////
	// GOLD
	case "gold":
		break;
}
switch(global.hat_equipped)
{
	////////////////////////////////////////////////////////
	// BLUE
	default:
		// idle
		global.spr_PlayerHat_idle_up = spr_hat_blue_idle_up
		global.spr_PlayerHat_idle_down = spr_hat_blue_idle_down
		global.spr_PlayerHat_idle_left = spr_hat_blue_idle_left
		global.spr_PlayerHat_idle_right = spr_hat_blue_idle_right

		// walk
		global.spr_PlayerHat_walk_up = spr_hat_blue_walk_up
		global.spr_PlayerHat_walk_down = spr_hat_blue_walk_down
		global.spr_PlayerHat_walk_left = spr_hat_blue_walk_left
		global.spr_PlayerHat_walk_right = spr_hat_blue_walk_right
		break;
		
	////////////////////////////////////////////////////////
	// GOLD
	case "gold":
		break;
}