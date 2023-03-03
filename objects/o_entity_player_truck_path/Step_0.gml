//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
	
	//check if road is blocked
	road_blocked = false;
	for (var i = 0; i < 3; i++) {
		var solid_obj = collision_rectangle(bbox_right,bbox_top+1,bbox_right+2,bbox_bottom-1,o_entity_env_solid,false,true);
		var obstacle = collision_rectangle(bbox_right,bbox_top+1,bbox_right+2,bbox_bottom-1,o_entity_env_obstacle,false,true);
		
		if(instance_exists(solid_obj) or instance_exists(obstacle)) {
			road_blocked = true;
		} else {
			road_blocked = false;
			road_blocked_message_timer = 0;
			road_blocked_message_on = false;
		}
	}
	
	if(road_blocked) {
		x = 0;
		image_blend = color_blocked;
	} else {
		x += movespeed;
		if(x > room_width + sprite_width) {
			x = 0;
			image_blend = color_clear;
		}
		
	}
	
}