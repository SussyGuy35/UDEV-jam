// Inherit the parent event
//event_inherited();

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
			decontructing = collision_point(x,y,o_entity_env,false,true);
			
			if(decontructing) {
				decontructing.rebuildable = false;
				var grid = instance_nearest(x,y,o_grid);
				var w = x / grid_size;
				var h = y / grid_size;
				grid.grid[w][h] = instance_create_layer(w*grid_size,h*grid_size,"Structures",o_entity_env_void);
				instance_destroy(decontructing);
			}
			
			instance_destroy();
		}
		
		if(hp < 0) hp = 0;
		
		//update spark image index
		spark_image_index++;
		if (spark_image_index == spark_image_number) spark_image_index = 0;
		/*
		var sx = irandom_range(bbox_left,bbox_right);
		var sy = irandom_range(bbox_top,bbox_bottom);
		
		instance_create_layer(sx,sy,"Bullets",o_gfx_spark_drop);
		*/
	}
}