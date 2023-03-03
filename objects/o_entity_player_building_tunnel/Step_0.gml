//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
	
	image_index += 0.25;
	if(image_index >= 5) image_index = 0;
	
	truck_id = instance_nearest(x,y,o_entity_player_truck);
	
	if(!instance_exists(truck_id)) {
		truck_respawn_timer--;
		if(truck_respawn_timer <= 0) {
			truck_respawn_timer = truck_respawn_interval;
			instance_create_layer(0,y,"Instances",o_entity_player_truck);
			instance_create_layer(1,y,"Instances",o_entity_player_soldier);
		} 
	} else {
		truck_respawn_timer = truck_respawn_interval;
	}
}

if(x > room_width / 2) image_xscale = -1; else image_xscale = 1