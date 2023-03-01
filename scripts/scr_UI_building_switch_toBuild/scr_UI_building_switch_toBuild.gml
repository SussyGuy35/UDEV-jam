// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_UI_building_switch_toBuild(to_build){
	if(!building_side) {
		building_side = instance_create_layer(mouse_x,mouse_y,"Bullets",o_entity_env_construction_side_building);
		building_side.side_to_build = to_build;
		building_side.side_update = true;
	} else {
		if(instance_exists(building_side)) {
			if(building_side.side_to_build != to_build) {
					building_side.side_to_build = to_build;
					building_side.side_update = true;
			}
		}
	}
}