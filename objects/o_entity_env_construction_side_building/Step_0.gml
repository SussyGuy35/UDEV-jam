if(side_update and side_to_build) {
	scr_construction_side_building_update(side_to_build);
}

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
		
		//update spark image index
		spark_image_index++;
		if (spark_image_index == spark_image_number) spark_image_index = 0;
		
		var sx = irandom_range(bbox_left,bbox_right);
		var sy = irandom_range(bbox_top,bbox_bottom);
		
		instance_create_layer(sx,sy,"Bullets",o_gfx_bullet_hit);
	}
	
	if(hp >= hp_max and side_placed) {
		contructing = instance_create_layer(x,y,"Buildings",side_to_build);

		instance_destroy();
	}
	
	if(hp <= 0) instance_destroy();
}