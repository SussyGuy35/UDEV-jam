// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_grid_map_generator(seed){
	random_set_seed(seed);
	
	//generate bedrock and void
	for(var w = 0; w < grid_w; w++) {
		for(var h = 0; h < grid_h; h++) {
			if(h < grid_h - 1) {
				ds_grid_add(dsgrid,w,h,instance_create_layer(w*grid_size,h*grid_size,"Structures",o_entity_env_void));
			} else {
				ds_grid_add(dsgrid,w,h,instance_create_layer(w*grid_size,h*grid_size,"Structures",o_entity_env_bedrock));
			}
		}
	}
	
	//generate flat stone for underground
	for(var w = 0; w < grid_w; w++) {
		for(var h = 0; h < grid_h; h++) {
			if(grid_h - h >= mapgen_min_impassable and grid_h - h < mapgen_max_underground) {
				var block = ds_grid_get(dsgrid,w,h);
				if(instance_exists(block)) instance_destroy(block);
				ds_grid_add(dsgrid,w,h,instance_create_layer(w*grid_size,h*grid_size,"Structures",o_entity_env_stone1));
			}
		}
	}
	
	
	//generate flat dirt for surface
	for(var w = 0; w < grid_w; w++) {
		for(var h = 0; h < grid_h; h++) {
			if(grid_h - h >= mapgen_max_underground and grid_h - h < mapgen_max_mountain) {
				var block = ds_grid_get(dsgrid,w,h);
				if(instance_exists(block)) instance_destroy(block);
				if(irandom_range(0,1) == 0) {
					ds_grid_add(dsgrid,w,h,instance_create_layer(w*grid_size,h*grid_size,"Structures",o_entity_env_grass0));
				} else ds_grid_add(dsgrid,w,h,instance_create_layer(w*grid_size,h*grid_size,"Structures",o_entity_env_grass1));
			}
		}
	}
	
}