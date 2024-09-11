function scr_player_state()
{
}


#region //STATE MACHINE\\
function gf_player_update()
{

	switch (player_state)
	{
		case GE_PLAYER_STATE.FREE: gf_player_state_free()
			break;
			
		case GE_PLAYER_STATE.SEQUENCE: gf_player_state_sequence()
			break;
			
		//case playerstate attakcing ()? funccao 
		//break;
	}	
	
	gf_player_spr_update()
}

function gf_player_state_dialog()
{
}


function gf_player_state_sequence()
{
}


function gf_player_spr_update()
{

}




function gf_player_state_free()
{
	// sets sprites to player coordinates
	PlayerBody_sprite_id.x = x
	PlayerBody_sprite_id.y = y
	PlayerCape_sprite_id.x = x
	PlayerCape_sprite_id.y = y
	PlayerHat_sprite_id.x = x
	PlayerHat_sprite_id.y = y
	PlayerHitbox_id.x = x
	PlayerHitbox_id.y = y
	
	move_x = gf_get_key_right_state() - gf_get_key_left_state()
	move_y = gf_get_key_down_state() - gf_get_key_up_state()
	 
	
	// calcs speed to move player
	move_x = move_x * player_speed;
	move_y = move_y * player_speed;
	
	
	
	// checks if player is moving for sprites
	if (move_x == 0 && move_y == 0)
	{
		var _moving = false
	}
	else
	{
		var _moving = true
	}

	// moves player character
	move_and_collide(move_x, 0, oWallCollider, 4, 0, 0, move_x, move_y) //move horizontal
	move_and_collide(0, move_y, oWallCollider, 4, 0, 0, move_x, move_y) // move vertical
	
	
	
	//////////////////////////////////////////////////////////////////////////

	if(sign(move_x) < 0)
	{
		PlayerBody_sprite_id.sprite_index = spr_player_walk_left
		PlayerCape_sprite_id.sprite_index = global.spr_PlayerCape_walk_left
		PlayerHat_sprite_id.sprite_index = global.spr_PlayerHat_walk_left
	}
	
	//////////////////////////////////////////////////////////////////////////
	
	if(sign(move_x)> 0)     
	{
		PlayerBody_sprite_id.sprite_index = spr_player_walk_right
		PlayerCape_sprite_id.sprite_index = global.spr_PlayerCape_walk_right
		PlayerHat_sprite_id.sprite_index = global.spr_PlayerHat_walk_right
	}
	
	//////////////////////////////////////////////////////////////////////////
	
	if (sign(move_y ) <0)		
	{
		PlayerBody_sprite_id.sprite_index = spr_player_walk_up
		PlayerCape_sprite_id.sprite_index = global.spr_PlayerCape_walk_up
		PlayerHat_sprite_id.sprite_index = global.spr_PlayerHat_walk_up
	}
	
	///////////////////////////////////////////////////////////////////////////
	
	 if(sign(move_y) >0)
	{
		PlayerBody_sprite_id.sprite_index = spr_player_walk_down
		PlayerCape_sprite_id.sprite_index = global.spr_PlayerCape_walk_down
		PlayerHat_sprite_id.sprite_index = global.spr_PlayerHat_walk_down
	}
	
	///////////////////////////////////////////////////////////////////////////
	
	if (!_moving && facing_side == 0)
	{
		PlayerBody_sprite_id.sprite_index = spr_player_idle_left
		PlayerCape_sprite_id.sprite_index = global.spr_PlayerCape_idle_left
		PlayerHat_sprite_id.sprite_index = global.spr_PlayerHat_idle_left
	}
	if (!_moving && facing_side == 2)
	{
		PlayerBody_sprite_id.sprite_index = spr_player_body_idle_up
		PlayerCape_sprite_id.sprite_index = global.spr_PlayerCape_idle_up
		PlayerHat_sprite_id.sprite_index = global.spr_PlayerHat_idle_up
	}
	if (!_moving && facing_side == 3)
	{
		PlayerBody_sprite_id.sprite_index = spr_player_body_idle_down
		PlayerCape_sprite_id.sprite_index = global.spr_PlayerCape_idle_down
		PlayerHat_sprite_id.sprite_index = global.spr_PlayerHat_idle_down
	}
	if (!_moving && facing_side == 1)
	{
		PlayerBody_sprite_id.sprite_index = spr_player_idle_right
		PlayerCape_sprite_id.sprite_index = global.spr_PlayerCape_idle_right
		PlayerHat_sprite_id.sprite_index = global.spr_PlayerHat_idle_right
	}
	
	
	if(sign(move_x) == -1 )
	{
		facing_side = GE_FACING.LEFT;
	}
	else if(sign(move_x) == 1 )
	{
		facing_side = GE_FACING.RIGHT;
	}	
	else if(sign(move_y) == -1 )
	{
		facing_side = GE_FACING.UP;
	}
	else if(sign(move_y) == 1 )
	{
		facing_side = GE_FACING.DOWN;
	}
}

#endregion
