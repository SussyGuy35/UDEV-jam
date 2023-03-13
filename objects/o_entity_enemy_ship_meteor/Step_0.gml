//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
	
	image_index += 0.5;
	if(image_index >= 7) image_index = 0;
	
	if(hp <= 0) {
		instance_create_layer(x,y,"Bullets",o_gfx_explosion);
		playsound_missile_explode = true;
		instance_destroy();
	} else {
		hatch_cooldown_timer--;
		if(hatch_cooldown_timer <= 0) {
			if(!hatch_closing) {
				hatch_opening += hatch_speed;
				if(hatch_opening == hatch_opening_max) {
					hatch_cooldown_timer = hatch_cooldown_interval;
					hatch_closing = true;
				}
			} else {
				hatch_opening -= hatch_speed;
				if(hatch_opening == -1) {
					hatch_cooldown_timer = hatch_cooldown_interval;
					hatch_closing = false;
					
					mainwp_burst_index = mainwp_burst_number;
				}
			}
		}
		
		if(hatch_opening == hatch_opening_max) {
			mainwp_fire_timer--;
			if(mainwp_fire_timer <= 0 and mainwp_burst_index > 0) {
				if(mainwp_burst_index mod 2 == 0) {
					instance_create_layer(x + mainwp_x, y + mainwp_y,"Bullets",o_entity_enemy_meteor);
					instance_create_layer(x + mainwp_x, y + mainwp_y,"Bullets",o_gfx_ship_muzzle_flash0);
					playsound_ship_weapon0 = true;
				} else {
					instance_create_layer(x + mainwp_x, y + mainwp_y,"Structures",o_entity_enemy_meteor);
					instance_create_layer(x + mainwp_x, y + mainwp_y,"Bullets",o_gfx_ship_muzzle_flash0);
					playsound_ship_weapon0 = true;
				}
				mainwp_burst_index--;
				if(mainwp_burst_index == 0) {
					hatch_cooldown_timer = 0;	
				}
				mainwp_fire_timer = mainwp_fire_interval;
			}	
		} else if (hatch_opening == -1) {
			subwp_fire_timer--;
			if(subwp_fire_timer <= 0) {
				var r_target = noone;
				for (var i = 0; i < instance_number(o_entity_player); ++i;)	{
							ds_list_add(target_list,instance_find(o_entity_player,i));
				}
						
				//get target list size
				var list_size = ds_list_size(target_list);
							
				if(list_size > 0) { //if list size not empty
					//get a random target on the list
					var rand_target = irandom_range(0,list_size -1);
					r_target = ds_list_find_value(target_list,rand_target);
				}
				
				if(instance_exists(r_target)) {
					with (instance_create_layer(x + subwp_x[subwp_index], 
												y + subwp_y, 
												"Bullets", 
												o_entity_enemy_missile2)) 
					{
						target = r_target;
						playsound_missile_launch2 = true;
					}
				}
				subwp_index++;
				if(subwp_index == subwp_number) subwp_index = 0;
				subwp_fire_timer = subwp_fire_interval;
			}
		}
	}
}