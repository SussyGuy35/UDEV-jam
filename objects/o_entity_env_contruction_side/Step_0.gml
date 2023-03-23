//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
	
	//progressing contruction
	if(instance_exists(contructor)) {
		playsound_contruction = true;
		hp += contructor.speed_contruction;
	
		if(hp >= hp_max) {
			contructing = instance_create_layer(x,y,"Structures",contructing);
			with (contructing) {
				rebuildable = true;
				instruction_direction = other.instruction_direction;
			}
			var col_grid = collision_point(mouse_x,mouse_y,o_entity_env_void,false,true);
		
			with (instance_nearest(x,y,o_grid)) {
				var _x = other.contructing.x / grid_size;
				var _y = other.contructing.y / grid_size;
				grid[_x][_y] = other.contructing;
			}
		
			instance_destroy(col_grid);
			instance_destroy();
		}
		
		if(hp < 0) hp = 0;
		//update spark image index
		spark_image_index++;
		if (spark_image_index == spark_image_number) spark_image_index = 0;
		
		if(instance_exists(contructor) and rebuildable) {
			global.rebuild++;
		}
		/*
		var sx = irandom_range(bbox_left,bbox_right);
		var sy = irandom_range(bbox_top,bbox_bottom);
		
		instance_create_layer(sx,sy,"Bullets",o_gfx_spark_drop);
		*/
	}
}