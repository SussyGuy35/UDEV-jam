// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_place_env_creativemode_building(building){
	//check if it's a grounded building
	if(building != o_entity_player_building) return noone;
	
	if(keyboard_check(vk_lshift)) {
		/* TEMPORALLY DISABLED - NO CONTRUCTION SIDE FOR BUILDING YET
		var col_grid = collision_point(mouse_x,mouse_y,o_entity_env_void,false,true);
		if (col_grid) {
			with(instance_create_layer(col_grid.x,col_grid.y,"Structures",o_entity_env_contruction_side)) {
			contructing = building;
			}
			instance_destroy(col_grid);
		}
		*/
	} else {
		//instance_create_layer(col_grid.x,col_grid.y,"Structures",building);
	}
}