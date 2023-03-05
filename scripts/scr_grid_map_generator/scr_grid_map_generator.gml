// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_grid_map_generator(seed){
	//map generator variable
	mapgen_min_impassable = 6;
	mapgen_max_underground = 15;
	mapgen_max_mountain = 45;
	mapgen_min_stone0 = mapgen_min_impassable;
	mapgen_max_stone0 = 30
	mapgen_blob_radius_stone0 = 5;
	mapgen_blob_density_stone0 = 60;
	mapgen_blob_count_stone0 = 20;
	
	random_set_seed(seed);
	
	//generate bedrock and void
	for(var w = 0; w < grid_w; w++) {
		for(var h = 0; h < grid_h; h++) {
			if(h < grid_h - 1) {
				var new_block = instance_create_layer(w*grid_size,h*grid_size,"Structures",o_entity_env_void);
				with (new_block) {
					grid_x = w;
					grid_y = h;
				}
				ds_grid_add(dsgrid,w,h,new_block);
			} else {
				var new_block = instance_create_layer(w*grid_size,h*grid_size,"Structures",o_entity_env_bedrock);
				with (new_block) {
					grid_x = w;
					grid_y = h;
				}
				ds_grid_add(dsgrid,w,h,new_block);
			}
		}
	}
	
	//generate flat stone for underground
	for(var w = 0; w < grid_w; w++) {
		for(var h = 0; h < grid_h; h++) {
			if(grid_h - h >= mapgen_min_impassable and grid_h - h < mapgen_max_underground) {
				var block = ds_grid_get(dsgrid,w,h);
				if(instance_exists(block)) {
					var new_block = instance_create_layer(w*grid_size,h*grid_size,"Structures",o_entity_env_stone1);
					with (new_block) {
						grid_x = block.grid_x;
						grid_y = block.grid_y;
					}
					instance_destroy(block);
				}
				ds_grid_add(dsgrid,w,h,new_block);
			}
		}
	}
	
	
	//generate flat dirt for surface
	for(var w = 0; w < grid_w; w++) {
		for(var h = 0; h < grid_h; h++) {
			if(grid_h - h >= mapgen_max_underground and grid_h - h < mapgen_max_mountain) {
				var block = ds_grid_get(dsgrid,w,h);
				if(instance_exists(block)) {
					if(irandom_range(0,1) == 0) {
						new_block = instance_create_layer(w*grid_size,h*grid_size,"Structures",o_entity_env_grass0);
					} else new_block = instance_create_layer(w*grid_size,h*grid_size,"Structures",o_entity_env_grass1);
					with (new_block) {
						grid_x = block.grid_x;
						grid_y = block.grid_y;
					}
					instance_destroy(block);
				}
				ds_grid_add(dsgrid,w,h,new_block);
			}
		}
	}
	
	//generate stone0 blobs
	for (var i = 0; i < mapgen_blob_count_stone0; i++) {
		var random_y = grid_size * irandom_range(grid_h - mapgen_min_stone0, grid_h - mapgen_max_stone0);
		var random_x = grid_size * irandom_range(0,grid_w)
	
		for (var j =  0; j < mapgen_blob_density_stone0; j++) {
			var random_dir = random_range(0,360);
			var random_len = irandom_range(0,grid_size * mapgen_blob_radius_stone0);
			var rx = random_x + lengthdir_x(random_len,random_dir);
			var ry = random_y + lengthdir_y(random_len,random_dir);
			var block = collision_point(rx,ry,o_entity_env,false,true);
			if(instance_exists(block)) {
				if(block.grid_x >= 0 
					and grid_h - block.grid_y >= mapgen_min_stone0 
					and grid_h - block.grid_y < mapgen_max_stone0) 
				{
					var new_block = instance_create_layer(block.x,block.y,"Structures",o_entity_env_stone0);
					with (new_block) {
						grid_x = block.grid_x;
						grid_y = block.grid_y;	
					}
					instance_destroy(block);
					ds_grid_add(dsgrid,new_block.grid_x,new_block.grid_y,new_block);
				}
			}
		}
	}
}