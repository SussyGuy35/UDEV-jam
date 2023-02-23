//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
	
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
	
	if(on_ground) {
        state = ENTITY_STATE.MOVING;
    }
	
	if(target_enemy) {
		state = ENTITY_STATE.ATTACKING;
	} else {
		muzzle_flashing = false;	
	}
    
	if(hp <= 0) {
		state = ENTITY_STATE.DEAD;
	}
	
    //thực hiện hành vi dựa vào trạng thái
    switch (state) {
        case ENTITY_STATE.IDLE:
            image_index = 0;
            image_speed = 0;
            break;
            
        case ENTITY_STATE.MOVING:
            if(image_index == 2) image_index = 3; else image_index = 2;
            
            hsp = dir*movespeed;
            break;
		
		case ENTITY_STATE.DEAD:
			muzzle_flashing = false;
			image_speed = 0;
			if(image_index >= 14 and image_index < 18) {
				image_index++;
			} else if (image_index = 18) {
				dead_despawn_timer--;
				if(dead_despawn_timer <= 0) instance_destroy();
			} else image_index = 14;
			
			break;
		case ENTITY_STATE.ATTACKING:
			scr_soldier_attacking();
			
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