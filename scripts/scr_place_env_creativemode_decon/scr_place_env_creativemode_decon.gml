// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_place_env_creativemode_decon(){
	if(instance_exists(grid_obj)) {
		var col_grid = collision_point(mouse_x,mouse_y,o_entity_env_void,false,true);
		if(!col_grid) {
			var sx = mouse_x - mouse_x mod grid_obj.grid_size;
			var sy = mouse_y - mouse_y mod grid_obj.grid_size;
			instance_create_layer(sx,sy,"Bullets",o_entity_env_decontruction_side);
		}
	}
}