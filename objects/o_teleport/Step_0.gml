//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
	
	if(!falling) {
		image_index++;
		if(image_index == image_number -1) {
			image_alpha = 0;
			hsp = -movespeed;
		}
	} else {
		
	}
	
	if(y < 0) {
		falling = true;
		x = des_x
		hsp = movespeed
	}
	
	y += hsp;
	
	if(point_distance(x,y,des_x,des_y) <= movespeed and x == des_x) {
		hsp = 0;
		y = des_y;
	}
	
	//create obj when teleport is done
	if(x == des_x and y == des_y) {
		image_alpha = 1;
		image_index--;
		if(image_index == 0) {
			var spawn = instance_create_layer(x,y,"Instances",obj);
			if(instance_exists(spawn)) {
				with(spawn) {
					hp = other.obj_hp;
					if(object_index == o_entity_player_soldier 
						or object_index == o_entity_player_knight) soldier_count--;
				}
			}
			instance_destroy();
		}
	}
	
	if(!object_exists(obj)) instance_destroy();
}