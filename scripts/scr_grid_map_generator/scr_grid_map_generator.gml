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
	mapgen_max_cavern = 30
	mapgen_tree_desity = 0.2;
	
	random_set_seed(seed);
	//Perlin Noise variables
	Y_start = random(1000);
	X = random(1000);
	inc = 0.2; //transition prequency
	
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
	
	//generating mountain and hills
	var _y = irandom_range(mapgen_max_underground,mapgen_max_mountain-1);
	for(var _x = 0; _x < grid_w; _x++) {
		//generating surface
		var new_block;
		var block = collision_point(_x*grid_size,(grid_h - _y) * grid_size,o_entity_env,false,true);
			if(instance_exists(block)) {
				new_block = instance_create_layer(_x*grid_size,(grid_h - _y)*grid_size,"Structures",o_entity_env_grass0);
				with (new_block) {
					grid_x = block.grid_x;
					grid_y = block.grid_y;	
				}
				instance_destroy(block);
				ds_grid_add(dsgrid,_x,_y,new_block);
				
				if(instance_exists(new_block) and random_range(0,1) < mapgen_tree_desity) {
					var impassable = collision_rectangle(new_block.x,
														new_block.y - 16,
														new_block.x + 3,
														new_block.y ,
														o_entity_env_impassable,false,true);
					var prop = collision_rectangle(new_block.x - 2,
													new_block.y - 16,
													new_block.x + 6,
													new_block.y ,
													o_entity_env_prop,false,true);
										
					if(!instance_exists(prop) and !instance_exists(impassable)) {
						var roll = irandom_range(0,1);
						if(roll == 0) {
							tree = instance_create_layer(new_block.x + 2, new_block.y, "Bullets", o_entity_env_prop_tree_pine);
						} else if (roll == 1) {
							tree = instance_create_layer(new_block.x + 2, new_block.y, "Bullets", o_entity_env_prop_tree_oak);
						}
						with (tree) {
							grow_stage = irandom_range(0,grow_stage_max);
						}
					}
				}
			}
		//fill up with dirt	
		for(var i = mapgen_max_underground; i < _y; i++) {
			block = collision_point(_x*grid_size,(grid_h - i) * grid_size,o_entity_env,false,true);
			if(instance_exists(block)) {
				new_block = instance_create_layer(_x*grid_size,(grid_h - i)*grid_size,"Structures",o_entity_env_grass0);
				with (new_block) {
					grid_x = block.grid_x;
					grid_y = block.grid_y;	
				}
				instance_destroy(block);
				ds_grid_add(dsgrid,_x,i,new_block);
			}
		}
		//updating surface attitude
		var rand = irandom_range(mapgen_max_underground,mapgen_max_mountain-1);
		if(_y < rand) _y++; else if (_y > rand) _y--;
	}
	/*
	//generate flat dirt for surface (old)
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
	*/
	//generate stones
	for (var w = 0; w < grid_w; w++) {
		var Y = Y_start;
		for (var h = grid_h - mapgen_max_stone0; h < grid_h - mapgen_min_stone0; h++) {
			
			var _val = perlin_noise(X, Y);
			var _col_val = map_value(_val, -1, 1, 0,255);
			
			if (_col_val < 100) {
				var block = collision_point(w*grid_size,h*grid_size,o_entity_env,false,true);
				if(instance_exists(block)) {
					var new_block = instance_create_layer(block.x,block.y,"Structures",o_entity_env_stone0);
					with (new_block) {
						grid_x = block.grid_x;
						grid_y = block.grid_y;	
					}
					instance_destroy(block);
					ds_grid_add(dsgrid,new_block.grid_x,new_block.grid_y,new_block);
				}
			}
		
			Y += inc;
		}
		X += inc;
	}
	
	//generating caves
	for (var w = 0; w < grid_w; w++) {
		var Y = Y_start;
		for (var h = grid_h - mapgen_max_cavern; h < grid_h - 2; h++) {
			
			var _val = perlin_noise(X, Y);
			var _col_val = map_value(_val, -1, 1, 0,255);
			
			if (_col_val < 100) {
				var block = collision_point(w*grid_size,h*grid_size,o_entity_env,false,true);
				if(instance_exists(block)) {
					var new_block = instance_create_layer(block.x,block.y,"Structures",o_entity_env_void);
					with (new_block) {
						grid_x = block.grid_x;
						grid_y = block.grid_y;	
					}
					instance_destroy(block);
					ds_grid_add(dsgrid,new_block.grid_x,new_block.grid_y,new_block);
				}
			}
		
			Y += inc;
		}
		X += inc;
	}
}