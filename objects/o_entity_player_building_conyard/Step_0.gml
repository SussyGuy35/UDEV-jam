//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
	
	health_bar_display_timer--;
	
	//scan for construction side
	var conside = instance_nearest(x,y,o_entity_env_contruction_side);
	if(instance_exists(conside) and distance_to_object(conside <= construction_range)) {
		construction_target = conside;
	}
	var conside = instance_nearest(x,y,o_entity_env_construction_side_building);
	if(instance_exists(conside) and distance_to_object(conside <= construction_range)) {
		if(conside.side_placed) construction_target = conside;
	}
	var conside = instance_nearest(x,y,o_entity_env_decontruction_side);
	if(instance_exists(conside) and distance_to_object(conside <= construction_range)) {
		construction_target = conside;
	}
	
	if(instance_exists(construction_target)) {
		if(door_close > 0) {
			door_close--;
			door_to_open = true;
			state = ENTITY_STATE.DEPLOY;
		} else {
			construction_timer++;
			if(construction_timer >= construction_interval - 1) {
				construction_timer = 0;	
			}
			state = ENTITY_STATE.CONSTRUCTING;
		}
	} else {
		if(door_close < door_close_max) {
			door_close++;
			door_to_open = false;
			state = ENTITY_STATE.DEPLOY;
		} else {
			state = ENTITY_STATE.IDLE;
			construction_timer = 0;
		}
	}
	
	//actipn:
	switch (state) {
		case ENTITY_STATE.DEPLOY:
			if(door_to_open) {
				image_index = ani_door_open_start + door_close_max - door_close;
			} else {
				image_index = ani_door_close_start + door_close;
			}
			
			break;
		case ENTITY_STATE.CONSTRUCTING:
				image_index = ani_con_start + construction_timer;
				
				
				if(instance_exists(construction_target)) {
					if(!instance_exists(construction_target.contructor))
						construction_target.contructor = self;
				}
			break;
		case ENTITY_STATE.IDLE:
			if(image_index >= ani_idle_start and image_index <= ani_idle_end) {
				image_index++;
				if(image_index >= ani_idle_start) image_index = ani_idle_start;
			} else image_index = 0;
			break;
		default:
			break;
	}
	
	if(hp < 0) instance_destroy();
}

//bullet hit area
hit_area_left	= bbox_left - 1;
hit_area_right	= bbox_right - 2;
hit_area_top	= bbox_top - 1;
hit_area_bottom = bbox_bottom - 2;