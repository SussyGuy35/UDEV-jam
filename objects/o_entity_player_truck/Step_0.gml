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
		if(road_blocked_message_timer <= 0) {
			road_blocked_message_timer = road_blocked_message_interval;
			if(road_blocked_message_on) road_blocked_message_on = false;
				else road_blocked_message_on = true;
		}
		road_blocked_message_timer--;
	} else {
		if(image_index == 0) image_index = 1; else image_index = 0;
		x += movespeed;
		if(x > room_width + sprite_width) x = 0;
		
		if(x > sprite_width + 1) {
			distance_traveled++;
			if(distance_traveled >= distance_per_soldier_spawn) {
				distance_traveled = 0;
				global.truck_supplied++;
				with(instance_create_layer(x - image_xscale * sprite_width,y,"Instances",o_entity_player_knight)) {
					dir = -1;
				}
			}
		}
	}
	
	if(hp <= 0) instance_destroy();
}