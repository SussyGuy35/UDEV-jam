//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
	
	health_bar_display_timer--;
	
	image_index++;
	if(image_index >= image_number) image_index = 0;
	
	if(hp > 0) {
		spawn_timer--;
		if(spawn_timer <= 0) {
			spawn_timer = spawn_interval;
		
			var x1 = x - 2;
			var x2 = x + 1;
			var y1 = y - 8;
			var y2 = y - 1;
			var blocked_structures = ds_list_create();
			collision_rectangle_list(x1,y1,x2,y2,o_entity_env_obstacle,false, true, blocked_structures,false);
			collision_rectangle_list(x1,y1,x2,y2,o_entity_env_block,false, true, blocked_structures,false);
			collision_rectangle_list(x1,y1,x2,y2,o_entity_env_contruction_side,false, true, blocked_structures,false);
			collision_rectangle_list(x1,y1,x2,y2,o_entity_env_decontruction_side,false, true, blocked_structures,false);
			collision_rectangle_list(x1,y1,x2,y2,o_entity_env_ladder,false, true, blocked_structures,false);
		
			for(var i = 0; i < ds_list_size(blocked_structures); i++) {
				var obj = ds_list_find_value(blocked_structures,i);
				if(instance_exists(obj)) {
					obj.hp = -1;
				}
			}
		
			instance_create_layer(x, y,"Instances",o_entity_player_soldier);
		}
	} else instance_destroy();
}

//bullet hit area
hit_area_left	= bbox_left - 1;
hit_area_right	= bbox_right - 2;
hit_area_top	= bbox_top - 1;
hit_area_bottom = bbox_bottom - 2;