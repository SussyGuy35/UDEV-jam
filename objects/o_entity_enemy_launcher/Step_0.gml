//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
	
	//determine entity state
    state = ENTITY_STATE.MOVING;
	
	if(hp <= 0) state = ENTITY_STATE.DEAD;
	
	//action
	switch (state) {
		case ENTITY_STATE.IDLE:
            image_index = 0;
            image_speed = 0;
            break;
            
        case ENTITY_STATE.MOVING:
			if(phase_index == 0) { //walking phase
				if(image_index == 0) image_index = 1; else image_index = 0;
				phase_timer--;
				if(phase_timer <= 0) {
					phase_index++;
					phase_timer = phase_deploy;
				}
				hsp = dir*movespeed;

			
			} else if (phase_index == 1) { //deploy phase
				image_index = 10 - phase_timer / 4;
				phase_timer--;
				if(phase_timer <= 0) {
					phase_index = 2;
					phase_timer = phase_scaning;
				}
			
			} else if (phase_index == 2) { //scan phase
				if(image_index == 10) image_index = 11; else image_index = 10;
				
				//scan for structure or enemy
				if(!target) {
					//clear target list
					ds_list_clear(target_list);
					
					//get target list
					var target_structures = irandom_range(0,1);
					if(target_structures = 1) {
						for (var i = 0; i < instance_number(o_entity_env_block); ++i;)
						{
							ds_list_add(target_list,instance_find(o_entity_env_block,i));
						}
						for (var i = 0; i < instance_number(o_entity_env_obstacle); ++i;)
						{
							ds_list_add(target_list,instance_find(o_entity_env_obstacle,i));
						}
						
						//get target list size
						var list_size = ds_list_size(target_list);
							
						if(list_size > 0) { //if list size not empty
							//get a random target on the list
							var rand_target = irandom_range(0,list_size -1);
							target = ds_list_find_value(target_list,rand_target);
						}
					} else {
						for (var i = 0; i < instance_number(o_entity_player); ++i;)
						{
							ds_list_add(target_list,instance_find(o_entity_player,i));
						}
						
						//get target list size
						var list_size = ds_list_size(target_list);
							
						if(list_size > 0) { //if list size not empty
							//get a random target on the list
							var rand_target = irandom_range(0,list_size -1);
							target = ds_list_find_value(target_list,rand_target);
						}
					}
				} else {
					phase_timer--;
					if(phase_timer <= 0) {
						phase_index++;
						phase_timer = phase_launching;
					}
				}
			} else if (phase_index == 3) { //launching
				image_index = 22 - phase_timer;
				phase_timer--;
				if(phase_timer <= 0) {
					phase_index = 0;
					phase_timer = phase_moving;
				}
				
				if(image_index == 16) {
					with(instance_create_layer(x-2*dir,y-3,"Bullets",o_entity_enemy_missile)) {
						target = other.target;
					}
					playsound_missile_launch = true;
					target = noone;
				}
			}
            
            break;
		case ENTITY_STATE.DEAD:
			instance_create_layer(x,y,"Bullets",o_gfx_explosion);
			playsound_missile_explode = true;
			instance_destroy();
			
			break;
        default:    
            break;	
	}
	
	if (place_meeting(x+hsp, y, o_entity_env_solid) or place_meeting(x+sign(hsp),y, o_entity_env_obstacle)) {
	      while(place_meeting(x+sign(hsp),y, o_entity_env_solid) or place_meeting(x+sign(hsp),y, o_entity_env_obstacle))
	      {
	         if (collision_time<=collision_timeout){
				 x -= sign(hsp);
		         
				 dir*=-1
				 
			 }
			 else {
				break
			 }
			 collision_time ++
	      }
		  collision_time = 0
		  // dir *= -1
	}

	x += hsp;
	y += vsp;
	image_xscale = dir;
	
	if(x >= room_width - sprite_width or x <= 0) dir = -dir;

	hsp = 0;
	vsp = 0;

	//update hit area
	hit_area_left	= bbox_left - 1;
	hit_area_right	= bbox_right + 1;
	hit_area_top	= bbox_top + 1;
	hit_area_bottom = bbox_bottom - 2;
}