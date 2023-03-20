// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_place_env_rebuild(){
	with(instance_create_layer(x,y,"Structures",o_entity_env_contruction_side)) {
		instruction_direction = other.instruction_direction;
		contructing = asset_get_index(object_get_name(other.object_index));
		show_debug_message("asset index: " + string(contructing) + " - " + object_get_name(object_index));
	}
}