//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
	
	jetpack_spark_timer++;
	
	if(recalling) {
		var tent = instance_nearest(x,y,o_entity_player_building_tent);
		if(!instance_exists(tent)) tent = instance_nearest(x,y,o_entity_player_building_fort);
		if(instance_exists(tent) and recall_allow) {
			var rx = tent.x;
			var ry = tent.y;
			with(instance_create_layer(x,y,"Instances",o_teleport)) {
				des_x = rx;
				des_y = ry;
				obj = asset_get_index(object_get_name(other.object_index));
				obj_hp = other.hp;
			}
			playsound_ship_weapon0 = true;
			soldier_count++;
			instance_destroy();
			recall_allow = false;
		}
	}
	
	if(state != ENTITY_STATE.DEAD) {
		//scan for ladder
		on_ladder = collision_point(x,y-1,o_entity_env_ladder,false,true);
		if(!on_ladder) on_ladder = collision_point(x,y-5,o_entity_env_ladder,false,true);
		ladder_below = collision_point(x,y,o_entity_env_ladder,false,true);
		
		//scan for sign
		spotted_sign = noone;
		//spotted_sign = collision_point(x,y-1,o_entity_env_sign_direction,false,true);
		//if(!spotted_sign) spotted_sign = collision_point(x,y-5,o_entity_env_sign_direction,false,true);
		spotted_sign = collision_rectangle(bbox_left,bbox_top+4,bbox_right,bbox_bottom,o_entity_env_sign_direction,false,true)
		if (!spotted_sign) spotted_sign = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom-3,o_entity_env_sign_direction,false,true)
		if(spotted_sign) {
			if(spotted_sign.switch_on){ 
				if(spotted_sign.instruction_direction == INSTRUCTION_DIRECTION.RIGHTWARD) dir = 1
				else if(spotted_sign.instruction_direction == INSTRUCTION_DIRECTION.LEFTWARD) dir = -1
				else instruction_direction = spotted_sign.instruction_direction;
			}
		}
		
		//clear contruction data
		ds_list_clear(spotted_contruction); //clear spotted list
		if(instance_exists(target_contruction)) {
			target_contruction.contructor = noone; 
			target_contruction = noone; //reset target contruction side
		}
		
		//scan for contruction side
		collision_circle_list(x,y-2,range_contruction,o_entity_env_contruction_side,false,true,spotted_contruction,true);
		//scan for decontruction side
		collision_circle_list(x,y-2,range_contruction,o_entity_env_decontruction_side,false,true,spotted_contruction,true);
		//scan for building contruct side
		collision_circle_list(x,y-2,range_contruction,o_entity_env_construction_side_building,false,true,spotted_contruction,true);
		
		//scan for enemies
		ds_list_clear(spotted_enemies); //clear spotted list
		target_enemy = noone; //reset target enemy
		collision_circle_list(x,y,range,o_entity_enemy,false,true,spotted_enemies,true);
	
		//check line of sight
		var size = ds_list_size(spotted_enemies);
	
		for(var i = 0; i < size; i++) {
			//get enemy id
			var enemy = ds_list_find_value(spotted_enemies,i);
		
			//check if enemy is blocked (y should be -1 to avoid aiming below feet
			var blocked = collision_line(x,y - 1,enemy.x,enemy.y - 1,o_entity_env_solid,false,true);
		
			//if not blocked, that enemy is the target, end the loop
			if(!blocked and enemy.hp > 0) {
				target_enemy = enemy;
				i = size;
			}
		}
	}
	
	//ladder response
	scr_soldier_ladder_response();
	
	if(on_ground or state == ENTITY_STATE.LADDER) {
		//check for contruction clearance
		var size = ds_list_size(spotted_contruction);
	
		for(var i = 0; i < size; i++) {
			//get contruction side id
			var con_side = ds_list_find_value(spotted_contruction,i);
			
			//check if contruction side is occupied
			//if not, occupy the contruction side and work on it, end the loop
			if(instance_exists(con_side)) {
				if(!instance_exists(con_side.contructor)) {
					con_side.contructor = self;
					target_contruction = con_side;
					i = size;
				}
			}
		}
		
		if(instance_exists(target_contruction)) {
			state = ENTITY_STATE.CONSTRUCTING;
		} else {
			if(state != ENTITY_STATE.LADDER)
				state = ENTITY_STATE.MOVING;
		}
    }
	
	if(instruction_direction == INSTRUCTION_DIRECTION.JETPACK) {
		state = ENTITY_STATE.MOVING;	
	}
	
	
	if(target_enemy) {
		state = ENTITY_STATE.ATTACKING;
	} else {
		muzzle_flashing = false;	
	}
    
	if(hp <= 0) {
		state = ENTITY_STATE.DEAD;
		if(instance_exists(target_contruction)) //release contruction occupation
			target_contruction.contructor = noone; 
	}
	
    //thực hiện hành vi dựa vào trạng thái
    switch (state) {
        case ENTITY_STATE.IDLE:
            image_index = 0;
            image_speed = 0;
            break;
            
        case ENTITY_STATE.MOVING:
			if(instruction_direction == INSTRUCTION_DIRECTION.JETPACK and !recalling) {
				image_index = 3;
				if(jetpack_fuel > jetpack_flying_interval) {
					vsp = -4;
				} else {
					var enemy = instance_nearest(x,y,o_entity_enemy);
					if(instance_exists(enemy)) {
						var flight_dir = point_direction(x,y,enemy.x,enemy.y);
						var angle_dif = angle_difference(flight_dir,jetpack_dir);
						if(abs(angle_dif) < jetpack_turning) {
							jetpack_dir = angle_dif;
						} else {
							jetpack_dir += sign(angle_dif) * jetpack_turning;	
						}
						if(point_distance(x,y,enemy.x,enemy.y) < jetpack_standoff_range) {
							jetpack_dir = flight_dir - 90;
							hsp -= lengthdir_x(movespeed,jetpack_dir);
							vsp -= lengthdir_y(movespeed,jetpack_dir);
							vsp--;
						} else if(point_distance(x,y,enemy.x,enemy.y) >= jetpack_standoff_range) {
							hsp += lengthdir_x(movespeed,jetpack_dir);
							vsp += lengthdir_y(movespeed,jetpack_dir);
							vsp--;
						}
					}
				}
				jetpack_fuel--;
				if(jetpack_fuel <= 0) recalling = true;
			} else {	
				if(image_index == 2) image_index = 3; else image_index = 2;
				if(x >= room_width or x <= 0) dir = -dir;
				hsp = dir*movespeed;
			}
            break;
		
		case ENTITY_STATE.DEAD:
			muzzle_flashing = false;
			image_speed = 0;
			if(image_index >= 14 and image_index < 18) {
				image_index++;
			} else if (image_index = 18) {
				dead_despawn_timer--;
				if(dead_despawn_timer <= 0) instance_destroy();
			} else {
				playsound_soldier_die = true;
				image_index = 14;
			}
			
			break;
		case ENTITY_STATE.ATTACKING:
			scr_soldier_attacking();
						
			if(instruction_direction == INSTRUCTION_DIRECTION.JETPACK and !recalling) {
				var enemy = instance_nearest(x,y,o_entity_enemy);
				if(instance_exists(enemy)) {
					var flight_dir = point_direction(x,y,enemy.x,enemy.y);
					var angle_dif = angle_difference(flight_dir,jetpack_dir);
					if(abs(angle_dif) < jetpack_turning) {
						jetpack_dir = angle_dif;
					} else {
						jetpack_dir += sign(angle_dif) * jetpack_turning;	
					}
					if(point_distance(x,y,enemy.x,enemy.y) < jetpack_standoff_range) {
						jetpack_dir = flight_dir - 90;
						hsp -= lengthdir_x(movespeed,jetpack_dir);
						vsp -= lengthdir_y(movespeed,jetpack_dir);
						vsp--;
					} else if(point_distance(x,y,enemy.x,enemy.y) >= jetpack_standoff_range) {
						hsp += lengthdir_x(movespeed,jetpack_dir);
						vsp += lengthdir_y(movespeed,jetpack_dir);
						vsp--;
					}
				}
				
				jetpack_fuel--;
				if(jetpack_fuel <= 0) recalling = true;
			}
	
			break;
			
		case ENTITY_STATE.CONSTRUCTING:
			image_speed = 0;
			image_index = 19;
			if (x > target_contruction.x + 2) {
				dir = -1;
			} else if (x < target_contruction.x + 2) {
				dir = 1;
			}
			//image_xscale = sign(x - target_contruction.x + 2)
			
			break;
		case ENTITY_STATE.LADDER:
			x = x - x mod 4 + 2;
			if(image_index == 20) image_index = 21; else image_index = 20;

			if(image_xscale = 1) image_xscale = -1; else image_xscale = 1;
			if(instruction_direction == INSTRUCTION_DIRECTION.UPWARD) vsp--;
			
			break;
        default:    
            break;
    }
    
    //áp dụng trọng lực
    on_ground = false;
    vsp++;
}

scr_entity_solid_collision();

x += hsp;
y += vsp;
image_xscale = dir;

hsp = 0;
vsp = 0;