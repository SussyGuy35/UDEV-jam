/// @description Insert description here
// You can write your code in this editor






// Inherit the parent event
event_inherited();

if(autotile_update) {
	if(autotile_w_other_obstacle and autotile_w_other_solid) {
		image_index = autotile_get_tile(o_entity_env_impassable,4)
	} else if (autotile_w_other_obstacle and !autotile_w_other_solid) {
		image_index = autotile_get_tile(autotile_w_other_obstacle,4)
	} else if (!autotile_w_other_obstacle and autotile_w_other_solid) {
		image_index = autotile_get_tile(o_entity_env_solid,4)
	} else image_index = autotile_get_tile(object_index,4);
	autotile_update = false;
}

