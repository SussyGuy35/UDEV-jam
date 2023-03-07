/// @description Insert description here
// You can write your code in this editor






// Inherit the parent event
event_inherited();

if(autotile_update) {
	if (!object_to_autotile_w) {
		image_index = autotile_get_tile(object_index,4)
	}
	else {
		image_index = autotile_get_tile_w_other(object_index,object_to_autotile_w,4)	
	}
	autotile_update = false;
}

