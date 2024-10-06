/// @description Stored in save file
global.coins = 0
global.item_inv = array_create(0)

global.cape_equipped = "Blue"
global.hat_equipped = "Blue"
global.staff_equipped = 0
global.health_max = 3
global.mana_max = 10

skipRoomSave = false

// struct for game/player data
global.statData =
{
	
	save_x : 0, 
	save_y : 0, 
	save_rm : "rm_Demo1", // starting room
	save_enter : 0,
	
	coins : 0,
	item_inv : 0,
	
	cape_equipped : "Blue",
	hat_equipped : "Blue",
	staff_equipped : 0,
	
	health_max : 3,
	mana_max : 10,
}

// structs for level data
global.levelData = 
{
	level_1 : 0, // demo 1
	level_2 : 0, // demo 2
	level_3 : 0,
}

global.configData = 
{
	language : 0,
	window_size : 0,
	fullscreen : 0,
}