/// @description Data Transfer to next room
// You can write your code in this editor

// Create data carrier
if (!instance_exists(player_data_carrier))
{
	instance_create_depth(0, 0, 0, player_data_carrier)
}

// set data carriers values
if (instance_exists(player_data_carrier))
{
	if targetEnter != noone {player_data_carrier.targetEnter = targetEnter}
}