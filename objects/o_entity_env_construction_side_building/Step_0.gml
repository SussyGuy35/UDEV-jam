if(side_update and side_to_build) {
	side_update = false;
	
	hp_max = side_to_build.hp_max;
	side_to_build_sprite = side_to_build.sprite_index;
	side_w = side_to_build.sprite_width;
	side_h = side_to_build.sprite_height;
	side_xoffset = side_to_build.sprite_xoffset;
	side_yoffset = side_to_build.sprite_yoffset;
	side_must_be_grounded = side_to_build.must_grounded;
	must_grounded = side_to_build.must_grounded;
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
	
		if(hp >= hp_max) {
			contructing = instance_create_layer(x,y,"Buildings",side_to_build);

			instance_destroy();
		}
		
		//update spark image index
		spark_image_index++;
		if (spark_image_index == spark_image_number) spark_image_index = 0;
		
		var sx = irandom_range(bbox_left,bbox_right);
		var sy = irandom_range(bbox_top,bbox_bottom);
		
		instance_create_layer(sx,sy,"Bullets",o_gfx_bullet_hit);
	}
	
	if(hp <= 0) instance_destroy();
}