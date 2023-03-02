//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
	
	health_bar_display_timer--;
	
	//scan for soldier
	//if collide with soldier, mount that soldier on the seat
	var soldier = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,o_entity_player_soldier,false,true);
	if(instance_exists(soldier) and !soldier_occupied) {
		soldier_occupied = true;
		soldier_health = soldier.hp;
		instance_destroy(soldier);
	}
	
	//check previous hp, if lost more than occupied soldier, lose the soldier
	if(hp_prev > hp) {
		soldier_health -= hp - hp_prev;
		if(soldier_health <= 0) {
			soldier_health = 0;
			soldier_occupied = false;
			with(instance_create_layer(x,y,"Instances",o_entity_player_soldier)) {
				hp = -1;
			}
		}
	}
	hp_prev = hp;
	
	//scan for enemies
	ds_list_clear(spotted_enemies); //clear spotted list
	target_enemy = noone; //reset target enemy
	collision_circle_list(x,y,max_range,o_entity_enemy,false,true,spotted_enemies,true);
	
	//check line of sight
	var size = ds_list_size(spotted_enemies);
	
	for(var i = 0; i < size; i++) {
		//get enemy id
		var enemy = ds_list_find_value(spotted_enemies,i);
		
		//check if enemy is blocked (y should be -1 to avoid aiming below feet
		var blocked = collision_line(x,y - 1,enemy.x,enemy.y - 1,o_entity_env_solid,false,true);
		
		//check if enemy is not below the turret
		var bellow = false;
		if(enemy.y >= y) bellow = true;
		
		//check if enemy is closer than minimum range
		var too_close = false;
		if(point_distance(x,y,enemy.x,enemy.y) < min_range) too_close = true;
		
		//if not blocked or bellow, that enemy is the target, end the loop
		if(!blocked and !bellow and enemy.hp > 0 and !too_close) {
			target_enemy = enemy;
			i = size;
		}
	}
	
	//determine state
	if(soldier_occupied) {
		state = ENTITY_STATE.DEPLOY;
	} else state = ENTITY_STATE.IDLE;
	
	if(instance_exists(target_enemy)) {
		state = ENTITY_STATE.ATTACKING;
		
		var direction_to_target = point_direction(x,y,target_enemy.x,target_enemy.y);
		
		if(direction_to_target > 144 and direction_to_target <= 180) {
			flak_dir = 0;
		} else if (direction_to_target > 108 and direction_to_target <= 144) {
			flak_dir = 1
		} else if (direction_to_target > 72 and direction_to_target <= 108) {
			flak_dir = 2;
		} else if (direction_to_target > 36 and direction_to_target <= 72) {
			flak_dir = 3;
		} else flak_dir = 4;
	}
	
	if(hp <= 0) state = ENTITY_STATE.DEAD;
	
	//action
	switch (state) {
		case ENTITY_STATE.IDLE:
			image_index = flak_dir;
			break;
		case ENTITY_STATE.DEPLOY:
			image_index = 5 + flak_dir;
			break;
		case ENTITY_STATE.ATTACKING:
			if(image_index mod 2 == 0) {
				image_index = 11 + flak_dir * 2;
			} else image_index = 10 + flak_dir * 2;
			
			//generate random deviation point from the target
			var distance = point_distance(x,y,target_enemy.x,target_enemy.y);
			deviation = distance * tan(degtorad(angle_deviation));
			
			var random_dir = random_range(0,360);
			var random_deviation = random_range(0,deviation);
			
			//create flak explosion
			var flak_x = target_enemy.x + lengthdir_x(random_deviation,random_dir);
			var flak_y = target_enemy.y + lengthdir_y(random_deviation,random_dir);
			instance_create_layer(flak_x,flak_y,"Bullets",o_flak_explosion);
			
			playsound_gun0 = true;
			
			break;
		case ENTITY_STATE.DEAD:
			instance_create_layer(x,y,"Bullets",o_gfx_explosion);
			playsound_missile_explode = true;
			instance_destroy();
			break;
		default:
		
			break;
	}
}

//bullet hit area
hit_area_left	= bbox_left - 1;
hit_area_right	= bbox_right - 2;
hit_area_top	= bbox_top - 1;
hit_area_bottom = bbox_bottom - 2;