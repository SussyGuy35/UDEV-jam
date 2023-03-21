//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
	
	//resume path finding;
	path_speed = attack_movespeed * 2 * path_position + 1;
	
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
	
	
	//follow the path if not switch to flying or walking
	if(path_following) {
		state = ENTITY_STATE.PATH;
		if(path_position == 1) {
			path_following = false;
			path_end();
			path_clear_points(path);
		}
	} else {
		//switching between flying and walking
		if(deploy_timer >= deploy_interval) {
			//setting state
			state = ENTITY_STATE.FLYING;
			
			//flying time countdown
			flying_timer--;
			
			//if out of flying time
			if(flying_timer <= 0) {
				//teleport if success
				var roll = random_range(0,1);
				if(roll <= teleport_chance) {
					var rx = irandom_range(0,room_width);
					var ry = irandom_range(0,room_height - 20);
					if(!collision_point(rx,ry,o_entity_env_impassable,false,true)) {
						with(instance_create_layer(x,y,"Instances",o_teleport)) {
							des_x = rx;
							des_y = ry;
							obj = other.object_index;
							obj_hp = other.hp;
						}
						playsound_ship_weapon0 = true;
						instance_destroy();
					}
				}
				
				//deploy walking mode
				walking_timer = walking_interval;
				deploy_timer--;
				state = ENTITY_STATE.DEPLOY;
				
				//withdraw path finding request if exists
				var request_index = ds_list_find_index(global.path_request_obj_id,self) 
				if(request_index != -1) {
					ds_list_delete(global.path_request_obj_id,request_index);
					ds_list_delete(global.path_request_granted,request_index);
				}
			}
		} else if (deploy_timer <= 0) {
			if(on_ground) {
				//countdown walking time
				walking_timer--;
				
				//if out of walking time
				if(walking_timer <= 0) {
					//deploy flying mode
					flying_timer = flying_interval;
					deploy_timer++;
					state = ENTITY_STATE.DEPLOY;
				} else state = ENTITY_STATE.MOVING;
			}
		} else {
			state = ENTITY_STATE.DEPLOY;
		}
	}
	
	//attack if enemy spotted
	if(target_enemy) {
		state = ENTITY_STATE.ATTACKING;
		
		//switch to walking mode once done attacking
		deploy_timer = 0;
		walking_timer = walking_interval;
		
		//end path following
		path_following = false;
		path_end();
		path_clear_points(path);
	}
	
	if(stun_timer > 0) {
		stun_timer--;
		state = ENTITY_STATE.IDLE;
	}
	
	if(hp <= 0) {
		state = ENTITY_STATE.DEAD;
		
		//end path following
		path_end();
		
		//withdraw path finding request if exists
		var request_index = ds_list_find_index(global.path_request_obj_id,self) 
		if(request_index != -1) {
			ds_list_delete(global.path_request_obj_id,request_index);
			ds_list_delete(global.path_request_granted,request_index);
		}
	}
    
    //thực hiện hành vi dựa vào trạng thái
    switch (state) {
        case ENTITY_STATE.IDLE:
			path_speed = 0;
			
            break;
            
        case ENTITY_STATE.MOVING:
			if(image_index == 0) image_index = 1; else image_index = 0;
			if(x >= room_width or x <= 0) dir = -dir;
		    hsp = dir*movespeed;
			
			break;
		case ENTITY_STATE.DEPLOY:
			if(undeploy) { //flying -> walking
				deploy_timer--
				image_index = 2 + floor(deploy_timer/2);
				
				if(deploy_timer <= 0) {
					undeploy = false;
				}
			} else { //walking - > flying
				deploy_timer++;
				image_index = 2 + floor(deploy_timer/2);
				
				if(deploy_timer >= deploy_interval) {
					y--;
					undeploy = true;
				}
			}
			
			break;
			
		case ENTITY_STATE.PATH:
			if(image_index == 13) image_index = 14; else image_index = 13;
			
			//facing to the moving direction
			if(previous_x < x) {
				dir = 1;
			} else if(previous_x > x) {
				dir = -1;
			}
			
			break;
		case ENTITY_STATE.FLYING:
			if(image_index == 13) image_index = 14; else image_index = 13;
			vsp -= 2;
			
			//request path if needed
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
			if(!target_enemy) { //if no enemy found, find enemy
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
			
			break;
		case ENTITY_STATE.ATTACKING:
			image_index = 24;
			if(instance_exists(target_enemy)) {
				var attack_dir = point_direction(x,y - 2,target_enemy.x,target_enemy.y - 2);
				vsp += lengthdir_y(attack_movespeed,attack_dir);
				hsp += lengthdir_x(attack_movespeed,attack_dir);
				var distance = point_distance(x,y - 2,target_enemy.x,target_enemy.y - 2);
				if(distance <= attack_movespeed) {
					if(asset_get_index(object_get_name(target_enemy.object_index)) 
						== o_entity_player_knight) 
					{
						stun_timer = target_enemy.stun_power;
						target_enemy.attack_timer = 0;
						target_enemy.hp--;
					} else if (asset_get_index(object_get_name(target_enemy.object_index)) 
						== o_entity_player_building_fort) 
					{
						stun_timer = target_enemy.stun_power;
						target_enemy.hp--;
					} else {
						target_enemy.hp -= damage;
					}
				if(target_enemy.hp <= 0) target_enemy = noone;
			}
			}
			
			if(sign(hsp) < 0) {
				dir = -1;
			} else {
				dir = 1;
			}
			
			vsp--;
			
			break;
		case ENTITY_STATE.DEAD:
			image_speed = 0;
			if(image_index >= 19 and image_index < 23) {
				image_index++;
			} else if (image_index == 23) {
				dead_despawn_timer--;
				if(dead_despawn_timer <= 0) {
					instance_destroy();
				}
			} else {
				playsound_missile_explode = true;
				image_index = 19;
			}
			vsp++;
			
        default:    
            break;
    }
    
    //áp dụng trọng lực
    on_ground = false;
	
	hsp += knockback_x;
	vsp += knockback_y;
	
	if(abs(knockback_x) < 1) {
		knockback_x = 0;
	} else knockback_x /= 2;
	
	if(abs(knockback_y) < 1) {
		knockback_y = 0;
	} else knockback_y /= 2; 
	
	if(!path_following) {
		vsp++;
		scr_entity_solid_collision();
	} else {
		if(x == previous_x and y == previous_y) {
			path_following = false;
			path_end();
		}
	}

	previous_x = x;
	previous_y = y
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
	//pause path finding
	path_speed = 0;
	
	//find path when path finding request granted
	var request_index = ds_list_find_index(global.path_request_obj_id,self);
	
	//if there exist this object's path finding request
	if(request_index != -1) {
		//check if request is granted
		var granted = ds_list_find_value(global.path_request_granted,request_index);
		
		if(granted) {
			//sign out the request
			ds_list_delete(global.path_request_obj_id,request_index);
			ds_list_delete(global.path_request_granted,request_index);
			
			//find path to the target enemy
			if(instance_exists(target_enemy))
				mp_grid_path(global.path_grid,path,x,y,target_enemy.x,target_enemy.y,true);
			
			//start following the path
			path_start(path,movespeed / global.global_tick_interval,path_action_stop,true);
			path_following = true;
		}
	}
}

