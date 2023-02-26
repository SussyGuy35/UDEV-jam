//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
	
	/*
	//check if path is end
	if(path_position == 1) {
		path_following = false;
		path_clear_points(path);
	} else if(path_position == 0) {
		path_following = true;
		path_start(path,movespeed / global.global_tick_interval,path_action_stop,true);	
	}
	*/
	
	//scan for enemies
	ds_list_clear(spotted_enemies); //clear spotted list
	target_enemy = noone; //reset target enemy
	collision_circle_list(x,y,range,o_entity_player,false,true,spotted_enemies,true);
	
	//check line of sight
	var size = ds_list_size(spotted_enemies);
	
	for(var i = 0; i < size; i++) {
		//get enemy id
		var enemy = ds_list_find_value(spotted_enemies,i);
		
		//check if enemy is blocked (y should be -1 to avoid aiming below feet
		var blocked = collision_line(x,y - 2,enemy.x,enemy.y - 2,o_entity_env_solid,false,true);
		
		//if not blocked, that enemy is the target, end the loop
		if(!blocked and enemy.hp > 0) {
			target_enemy = enemy;
			i = size;
		}
	}
	
	if(on_ground) {
		state = ENTITY_STATE.MOVING;
	}
	/*
    if(on_ground) {
		on_ground_timer = on_ground_interval;
		if(flying) {
			deploy_timer = deploy_interval;
			flying = false;
		}
        state = ENTITY_STATE.MOVING;
    } else {
		on_ground_timer--;
		if(on_ground_timer <= 0) {
			if(!flying) {
				deploy_timer = deploy_interval;
			}
		}
		state = ENTITY_STATE.MOVING;
	}
	*/
	
	if(target_enemy) {
		state = ENTITY_STATE.ATTACKING;
		path_end();
	} 
	
	/*else {
		if(path_following) {
			var total_enemy = instance_number(o_entity_player);
			var enemy_index = irandom_range(0, total_enemy - 1);
		
			target_enemy = instance_find(o_entity_player,enemy_index);
			
			if(instance_exists(target_enemy)) { 
				//request path finding
				if(ds_list_find_index(global.path_request_obj_id,self) == -1) {
					ds_list_add(global.path_request_obj_id,self);
					ds_list_add(global.path_request_granted,false);
				}
			}
		}
	}
	*/
	
	if(hp <= 0) state = ENTITY_STATE.DEAD;
    
    //thực hiện hành vi dựa vào trạng thái
    switch (state) {
        case ENTITY_STATE.IDLE:
            image_index = 0;
            image_speed = 0;
            break;
            
        case ENTITY_STATE.MOVING:
			if(image_index == 0) image_index = 1; else image_index = 0;
		    hsp = dir*movespeed;
			/*
			image_speed = 0;
			if(deploy_timer >= 0) {
				image_index = 2 + (11 - floor(deploy_timer/2));
				if(image_index == 2) flying = true;
				deploy_timer--;
			} else {
				 if(image_index == 13) image_index++; else image_index = 13;
				 vsp--;
			}
			
			
			if(!flying) {
				if(deploy_timer <= 0) {
		            if(image_index == 0) image_index = 1; else image_index = 0;
		            hsp = dir*movespeed;
				} else {
					image_index = 12 - floor(deploy_timer/2);
					if(image_index == 12) {
						flying = true;
						y--;
					}
					deploy_timer--;
				}
			} else {
				if(deploy_timer <= 0) {
		            if(image_index == 13) image_index++; else image_index = 13;
					vsp -= 2;
				} else {
					image_index = 2 + (11 - floor(deploy_timer/2));
					if(image_index == 2) flying = false;
					deploy_timer--;
				}
			}
            */
			break;
		case ENTITY_STATE.ATTACKING:
			image_index = 24;
			var attack_dir = point_direction(x,y - 2,target_enemy.x,target_enemy.y - 2);
			
			vsp += lengthdir_y(attack_movespeed,attack_dir);
			hsp += lengthdir_x(attack_movespeed,attack_dir);
			
			if(sign(hsp) < 0) {
				dir = -1;
			} else {
				dir = 1;
			}
			
			var distance = point_distance(x,y - 2,target_enemy.x,target_enemy.y - 2);
			
			if(distance <= attack_movespeed) {
				target_enemy.hp -= damage;
				if(target_enemy.hp <= 0) target_enemy = noone;
			}
			vsp--;
			
			break;
		case ENTITY_STATE.DEAD:
			image_speed = 0;
			if(image_index >= 19 and image_index < 23) {
				image_index++;
			} else if (image_index == 23) {
				dead_despawn_timer--;
				if(dead_despawn_timer <= 0) instance_destroy();
			} else image_index = 19;
			
        default:    
            break;
    }
    
    //áp dụng trọng lực
    on_ground = false;
	vsp++;
	
	if(path_get_number(path) == 0) {
		scr_entity_solid_collision();
	}


	x += hsp;
	y += vsp;
	image_xscale = dir;

	hsp = 0;
	vsp = 0;

	//update hit area
	hit_area_left	= bbox_left - 1;
	hit_area_right	= bbox_right + 1;
	hit_area_top	= bbox_top + 1;
	hit_area_bottom = bbox_bottom - 2;
} else {
	var request_index = ds_list_find_index(global.path_request_obj_id,self);
	
	if(request_index != -1) {
		var granted = ds_list_find_value(global.path_request_granted,request_index);
		
		if(granted) {
			ds_list_delete(global.path_request_obj_id,granted);
			ds_list_delete(global.path_request_granted,granted);
			
			if(instance_exists(target_enemy))
				mp_grid_path(global.path_grid,path,x,y,target_enemy.x,target_enemy.y,true);
		}
	}
}

