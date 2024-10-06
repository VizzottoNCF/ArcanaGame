// room saving
function save_room()
{
	var _coinNum = instance_number(obj_coin)
	
	var _roomStruct =
	{
		coinNum : _coinNum,
		coinData : array_create(_coinNum)
	}
	
	// Get data from different savable objects
	
		// Coins
		for (var i = 0; i < _coinNum; i++)
		{
			var _inst = instance_find(obj_coin, i)
			_roomStruct.coinData[i] =
			{
				x : _inst.x,
				y : _inst.y,
			}
		}
	
	// Store the room specific struct in global.levelData's variable meant for that level
	if room == rm_Demo1 {global.levelData.level_1 = _roomStruct}
	if room == rm_Demo2 {global.levelData.level_2 = _roomStruct}
	
}

function load_room()
{
	var _roomStruct = 0
	
	// get correct struct for your room
	if room == rm_Demo1 {_roomStruct = global.levelData.level_1}
	if room == rm_Demo2 {_roomStruct = global.levelData.level_2}
	
	
	// EXIT if _roomStruct isn't a struct
	if (!is_struct(_roomStruct)) {exit}
	
	// COINS - get rid of the default room editor coins, then create new coins with all the data saved
	if (instance_exists(obj_coin)) {instance_destroy(obj_coin)}
	for (var i = 0; i < _roomStruct.coinNum; i++)
	{
		instance_create_layer(_roomStruct.coinData[i].x, _roomStruct.coinData[i].y, layer, obj_coin)
		
	}
	
}


// Overall saving
function save_game(_fileNum = 0)
{
	
	var _saveArray = array_create(0)
	
	// save the room you're in
	save_room()
	
	// set and save stats
	global.statData.save_x = oPlayer_Origin.x
	global.statData.save_y = oPlayer_Origin.y
	global.statData.save_rm = room_get_name(room)
	global.statData.save_enter = oPlayer_Origin.targetEnter
	
	// items
	global.statData.coins = global.coins
	global.statData.item_inv = global.item_inv
	
	// equipped items
	global.statData.cape_equipped = global.cape_equipped
	global.statData.hat_equipped = global.hat_equipped
	global.statData.staff_equipped = global.staff_equipped
	
	// status
	global.statData.health_max = global.health_max
	global.statData.mana_max = global.mana_max
	
	
	array_push(_saveArray, global.statData)
	
	
	// save all room data
	array_push(_saveArray, global.levelData)
	
	
	// Actual saving with json
	var _fileName = "savedata" + string(_fileNum) + ".sav"
	var _json = json_stringify(_saveArray)
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1)
	buffer_write(_buffer, buffer_string, _json)
	
	buffer_save(_buffer, _fileName)
	
	buffer_delete(_buffer)
	
	
}

function load_game(_fileNum = 0)
{
	// loading saved data
	var _filename = "savedata" + string(_fileNum) + ".sav"
	if (!file_exists(_filename)) {exit}
	
	// load buffer, get JSON, delete buffer to free memory
	var _buffer = buffer_load(_filename)
	var _json = buffer_read(_buffer, buffer_string)
	buffer_delete(_buffer)
	
	// parse into JSON
	var _loadArray = json_parse(_json)
	
	// set data to match loaded data
	global.statData = array_get(_loadArray, 0)
	global.levelData = array_get(_loadArray, 1)
	
	// items
	global.coins = global.statData.coins
	global.item_inv = global.statData.item_inv
	
	// equipped items
	global.cape_equipped = global.statData.cape_equipped
	global.hat_equipped = global.statData.hat_equipped
	global.staff_equipped = global.statData.staff_equipped
	
	// status
	global.health_max = global.statData.health_max
	global.mana_max = global.statData.mana_max
	
	
	// use new data to go back where we left in game
		// go to correct room
		var _loadRoom = asset_get_index(global.statData.save_rm)
		room_goto(_loadRoom)
		// make sure objSaveLoad doesn't save room you're exiting
		objSaveLoad.skipRoomSave = true
	
	if (instance_exists(oPlayer_Origin)) {instance_destroy(oPlayer_Origin)}
	instance_create_layer(global.statData.save_x, global.statData.save_y, layer, oPlayer_Origin)
	oPlayer_Origin.targetEnter = global.statData.save_enter
	
	// manually load room 
	load_room()
	
}