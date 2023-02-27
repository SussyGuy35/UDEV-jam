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
		
			var x1 = bbox_left + clear_area_x;
			var x2 = x1 + clear_area_size - 2;
			var y1 = bbox_top + clear_area_y;
			var y2 = y1 + clear_area_size - 2;
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
		
			instance_create_layer(x, y + 4,"Instances",o_entity_enemy_spider_smart);
		}
	} else {
		for(var i = 0; i < particle_per_frame; i++) {
			var rx = irandom_range(bbox_left - 12,bbox_right +11);
		var ry = irandom_range(bbox_top -12,bbox_bottom+11);
			ds_list_add(particle_x,rx);
			ds_list_add(particle_y,ry);
		}
		
		for (var i = 0; i < ds_list_size(particle_x); i++) {
			var nx = ds_list_find_value(particle_x,i);
			var ny = ds_list_find_value(particle_y,i);
			
			var dir = point_direction(nx,ny,x - 1, y - 1);
			
			nx += lengthdir_x(particle_speed,dir);
			ny += lengthdir_y(particle_speed,dir);
			
			ds_list_replace(particle_x,i,nx);
			ds_list_replace(particle_y,i,ny);
		}
	}
}

//bullet hit area
hit_area_left	= bbox_left - 2;
hit_area_right	= bbox_right - 3;
hit_area_top	= bbox_top - 2;
hit_area_bottom = bbox_bottom - 3;