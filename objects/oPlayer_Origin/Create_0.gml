// Standard Movement Speed
player_speed = 4


// find out which side player is facing for sprites
facing_side = 1

// sets player initial state
player_state = GE_PLAYER_STATE.FREE


// Creates Player Sprite
PlayerSillhouette_sprite_id = instance_create_layer(x, y, layer, obj_PlayerSillhouette_spr)
PlayerBody_sprite_id = instance_create_layer(x, y, layer, obj_PlayerBody_spr)
PlayerCape_sprite_id = instance_create_layer(x, y, layer, obj_PlayerCape_spr)
PlayerHat_sprite_id = instance_create_layer(x, y, layer, obj_PlayerHat_spr)

// Creates hitbox
PlayerHitbox_id = instance_create_layer(x, y, layer, obj_Player_Hitbox)


// temp hitbox alpha
image_alpha = 0.1;


// Extracts Width and Height from Camera Property
view_wview[0] = noone
view_hview[0] = noone


targetEnter = noone //figure out entry to room


/// GAME PROGRESS VARIABLES
