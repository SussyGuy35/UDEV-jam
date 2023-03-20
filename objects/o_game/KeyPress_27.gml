if(room_get_name(room) != "r_menu" and !instance_exists(instance_nearest(x,y,o_UI_game_menu))) {
	instance_create_layer(504,92,"Instances",o_UI_game_menu);	
}