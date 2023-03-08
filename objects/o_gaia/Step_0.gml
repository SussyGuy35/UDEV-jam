//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
	
	tree_plant_timer--;
	if(tree_plant_timer <= 0) {
		tree_plant_timer = tree_plant_interval
		var soil_number = instance_number(o_entity_env_soil);
		var soil = instance_find(o_entity_env_soil,irandom_range(0,soil_number - 1));

		if(instance_exists(soil)) {
			var impassable = collision_rectangle(soil.x,
												soil.y - 16,
												soil.x + 3,
												soil.y ,
												o_entity_env_impassable,false,true);
			var prop = collision_rectangle(soil.x - 2,
											soil.y - 16,
											soil.x + 6,
											soil.y ,
											o_entity_env_prop,false,true);
										
			if(!instance_exists(prop) and !instance_exists(impassable)) {
				var roll = irandom_range(0,1);
				if(roll == 0) {
					instance_create_layer(soil.x + 2, soil.y, "Bullets", o_entity_env_prop_tree_pine);
				} else if (roll == 1) {
					instance_create_layer(soil.x + 2, soil.y, "Bullets", o_entity_env_prop_tree_oak);
				}
			}
		}
	}
	
	vine_plant_timer--;
	if(vine_plant_timer <= 0) {
		vine_plant_timer = vine_plant_interval;
		
		var soil_number = instance_number(o_entity_env_soil);
		var soil = instance_find(o_entity_env_soil,irandom_range(0,soil_number - 1));

		if(instance_exists(soil)) {
			var impassable = collision_rectangle(soil.x,
												soil.bbox_bottom,
												soil.x + 3,
												soil.bbox_bottom + 3 ,
												o_entity_env_impassable,false,true);
			var prop = collision_rectangle(soil.x,
												soil.bbox_bottom,
												soil.x + 3,
												soil.bbox_bottom + 3 ,
											o_entity_env_prop,false,true);
										
			if(!instance_exists(prop) and !instance_exists(impassable)) {
				instance_create_layer(soil.x + 2, soil.bbox_bottom, "Structures", o_entity_env_prop_vine);
			}
		}
	}
}