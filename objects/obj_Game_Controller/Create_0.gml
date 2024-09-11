/// @description Check if doubled

slv_check_how_many = 0
with(obj_Game_Controller)
{
	other.slv_check_how_many++	
}

if(slv_check_how_many>1)
{
	show_debug_message("TOO MANY GLOBAL CONTROLERS PRESENT")
}