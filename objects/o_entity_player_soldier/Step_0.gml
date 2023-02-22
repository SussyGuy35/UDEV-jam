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
		if(!blocked) {
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
		image_speed = 0;
			//find the aim direction
			var aim_dir = point_direction(enemy.x,enemy.y,x,y);
			
			//use the sprite frame corresponding to the aim direction
			if(aim_dir >= 270 and aim_dir < 292.5) { //12 o'clock right
				dir = -1;
				
				if(image_index = 4) {
					image_index++;
					
					//muzzle flash effect
					fire_dir = 0;
					muzzle_flashing = true;
					
					//roll hit chance
					dice_hit = random_range(0,1);
					
					//hit animation if success
					if(dice_hit >= hit_chance) {
						var hit_x = irandom_range(target_enemy.hit_area_left,target_enemy.hit_area_right);
						var hit_y = irandom_range(target_enemy.hit_area_top, target_enemy.hit_area_bottom);
						instance_create_layer(hit_x,hit_y,"Bullets",o_gfx_bullet_hit);
						target_enemy.hp -= damage;
						if(target_enemy.hp = 0) {
							target_enemy.killed_by = self;
							target_enemy = noone;
						} else if(target_enemy.hp < 0) {
							target_enemy = noone;
						}
					}
				} else {
					image_index = 4;
					muzzle_flashing = false;
				}
				
			} else if (aim_dir >= 292.5 and aim_dir < 337.5) { //1:30
				dir = -1;
				
				if(image_index = 6) {
					image_index++;
					
					//muzzle flash effect
					fire_dir = 1;
					muzzle_flashing = true;
					
					//roll hit chance
					dice_hit = random_range(0,1);
					
					//hit animation if success
					if(dice_hit >= hit_chance) {
						var hit_x = irandom_range(target_enemy.hit_area_left,target_enemy.hit_area_right);
						var hit_y = irandom_range(target_enemy.hit_area_top, target_enemy.hit_area_bottom);
						instance_create_layer(hit_x,hit_y,"Bullets",o_gfx_bullet_hit);
						target_enemy.hp -= damage;
						if(target_enemy.hp = 0) {
							target_enemy.killed_by = self;
							target_enemy = noone;
						} else if(target_enemy.hp < 0) {
							target_enemy = noone;
						}
					}
				} else {
					image_index = 6;
					muzzle_flashing = false;
				}
			
			} else if ((aim_dir >= 337.5 and aim_dir < 360) or (aim_dir >= 0 and aim_dir < 22.5)) { // 3 o'clock
				dir = -1;
				
				if(image_index = 8) {
					image_index++;
					
					//muzzle flash effect
					fire_dir = 2;
					muzzle_flashing = true;
					
					//roll hit chance
					dice_hit = random_range(0,1);
					
					//hit animation if success
					if(dice_hit >= hit_chance) {
						var hit_x = irandom_range(target_enemy.hit_area_left,target_enemy.hit_area_right);
						var hit_y = irandom_range(target_enemy.hit_area_top, target_enemy.hit_area_bottom);
						instance_create_layer(hit_x,hit_y,"Bullets",o_gfx_bullet_hit);
						target_enemy.hp -= damage;
						if(target_enemy.hp = 0) {
							target_enemy.killed_by = self;
							target_enemy = noone;
						} else if(target_enemy.hp < 0) {
							target_enemy = noone;
						}
					}
				} else {
					image_index = 8;
					muzzle_flashing = false;
				}
				
			} else if (aim_dir >= 22.5 and aim_dir < 67.5) { //4:30
				dir = -1;
				
				if(image_index = 10) {
					image_index++;
					
					//muzzle flash effect
					fire_dir = 3;
					muzzle_flashing = true;
					
					//roll hit chance
					dice_hit = random_range(0,1);
					
					//hit animation if success
					if(dice_hit >= hit_chance) {
						var hit_x = irandom_range(target_enemy.hit_area_left,target_enemy.hit_area_right);
						var hit_y = irandom_range(target_enemy.hit_area_top, target_enemy.hit_area_bottom);
						instance_create_layer(hit_x,hit_y,"Bullets",o_gfx_bullet_hit);
						target_enemy.hp -= damage;
						if(target_enemy.hp = 0) {
							target_enemy.killed_by = self;
							target_enemy = noone;
						} else if(target_enemy.hp < 0) {
							target_enemy = noone;
						}
					}
				} else {
					image_index = 10;
					muzzle_flashing = false;
				}
				
			} else if (aim_dir >= 67.5 and aim_dir < 90) { //6 o' clock right
				dir = -1;
				
				if(image_index = 12) {
					image_index++;
					
					//muzzle flash effect
					fire_dir = 4;
					muzzle_flashing = true;
					
					//roll hit chance
					dice_hit = random_range(0,1);
					
					//hit animation if success
					if(dice_hit >= hit_chance) {
						var hit_x = irandom_range(target_enemy.hit_area_left,target_enemy.hit_area_right);
						var hit_y = irandom_range(target_enemy.hit_area_top, target_enemy.hit_area_bottom);
						instance_create_layer(hit_x,hit_y,"Bullets",o_gfx_bullet_hit);
						target_enemy.hp -= damage;
						if(target_enemy.hp = 0) {
							target_enemy.killed_by = self;
							target_enemy = noone;
						} else if(target_enemy.hp < 0) {
							target_enemy = noone;
						}
					}
				} else {
					image_index = 12;
					muzzle_flashing = false;
				}
				
			} else if (aim_dir >= 90 and aim_dir < 112.5) { //6 o'clock left
				dir = 1;
				
				if(image_index = 12) {
					image_index++;
					
					//muzzle flash effect
					fire_dir = 4;
					muzzle_flashing = true;
					
					//roll hit chance
					dice_hit = random_range(0,1);
					
					//hit animation if success
					if(dice_hit >= hit_chance) {
						var hit_x = irandom_range(target_enemy.hit_area_left,target_enemy.hit_area_right);
						var hit_y = irandom_range(target_enemy.hit_area_top, target_enemy.hit_area_bottom);
						instance_create_layer(hit_x,hit_y,"Bullets",o_gfx_bullet_hit);
						target_enemy.hp -= damage;
						if(target_enemy.hp = 0) {
							target_enemy.killed_by = self;
							target_enemy = noone;
						} else if(target_enemy.hp < 0) {
							target_enemy = noone;
						}
					}
				} else {
					image_index = 12;
					muzzle_flashing = false;
				}
				
			} else if (aim_dir >= 112.5 and aim_dir < 157.5) { //5:30
				dir = 1;
				
				if(image_index = 10) {
					image_index++;
					
					//muzzle flash effect
					fire_dir = 3;
					muzzle_flashing = true;
					
					//roll hit chance
					dice_hit = random_range(0,1);
					
					//hit animation if success
					if(dice_hit >= hit_chance) {
						var hit_x = irandom_range(target_enemy.hit_area_left,target_enemy.hit_area_right);
						var hit_y = irandom_range(target_enemy.hit_area_top, target_enemy.hit_area_bottom);
						instance_create_layer(hit_x,hit_y,"Bullets",o_gfx_bullet_hit);
						target_enemy.hp -= damage;
						if(target_enemy.hp = 0) {
							target_enemy.killed_by = self;
							target_enemy = noone;
						} else if(target_enemy.hp < 0) {
							target_enemy = noone;
						}
					}
				} else {
					image_index = 10;
					muzzle_flashing = false;
				}
				
			} else if (aim_dir >= 157.5 and aim_dir < 202.5) { //9 o'clock
				dir = 1;
				
				if(image_index = 8) {
					image_index++;
					
					//muzzle flash effect
					fire_dir = 2;
					muzzle_flashing = true;
					
					//roll hit chance
					dice_hit = random_range(0,1);
					
					//hit animation if success
					if(dice_hit >= hit_chance) {
						var hit_x = irandom_range(target_enemy.hit_area_left,target_enemy.hit_area_right);
						var hit_y = irandom_range(target_enemy.hit_area_top, target_enemy.hit_area_bottom);
						instance_create_layer(hit_x,hit_y,"Bullets",o_gfx_bullet_hit);
						target_enemy.hp -= damage;
						if(target_enemy.hp = 0) {
							target_enemy.killed_by = self;
							target_enemy = noone;
						} else if(target_enemy.hp < 0) {
							target_enemy = noone;
						}
					}
				} else {
					image_index = 8;
					muzzle_flashing = false;
				}
				
			} else if (aim_dir >= 202.5 and aim_dir < 247.5) { // 10:30
				dir = 1;
				
				if(image_index = 6) {
					image_index++;
					
					//muzzle flash effect
					fire_dir = 1;
					muzzle_flashing = true;
					
					//roll hit chance
					dice_hit = random_range(0,1);
					
					//hit animation if success
					if(dice_hit >= hit_chance) {
						var hit_x = irandom_range(target_enemy.hit_area_left,target_enemy.hit_area_right);
						var hit_y = irandom_range(target_enemy.hit_area_top, target_enemy.hit_area_bottom);
						instance_create_layer(hit_x,hit_y,"Bullets",o_gfx_bullet_hit);
						target_enemy.hp -= damage;
						if(target_enemy.hp = 0) {
							target_enemy.killed_by = self;
							target_enemy = noone;
						} else if(target_enemy.hp < 0) {
							target_enemy = noone;
						}
					}
				} else {
					image_index = 6;
					muzzle_flashing = false;
				}
				
			} else { // 12 o'clock left
				dir = 1;
				
				if(image_index = 4) {
					image_index++;
					
					//muzzle flash effect
					fire_dir = 0;
					muzzle_flashing = true;
					
					//roll hit chance
					dice_hit = random_range(0,1);
					
					//hit animation if success
					if(dice_hit >= hit_chance) {
						var hit_x = irandom_range(target_enemy.hit_area_left,target_enemy.hit_area_right);
						var hit_y = irandom_range(target_enemy.hit_area_top, target_enemy.hit_area_bottom);
						instance_create_layer(hit_x,hit_y,"Bullets",o_gfx_bullet_hit);
						target_enemy.hp -= damage;
						if(target_enemy.hp = 0) {
							target_enemy.killed_by = self;
							target_enemy = noone;
						} else if(target_enemy.hp < 0) {
							target_enemy = noone;
						}
					}
				} else {
					image_index = 4;
					muzzle_flashing = false;
				}
			}
			
			break;
        default:    
            break;
    }
    
    //áp dụng trọng lực
    on_ground = false;
    vsp++;
}

//xử lý va chạm
// Horizontal
if (place_meeting(x+hsp, y, o_entity_env_solid)) {
      while(place_meeting(x+sign(hsp),y, o_entity_env_solid))
      {
         x -= sign(hsp);
         if(sign(hsp) < 0) {
            dir = 1;
         } else {
            dir = -1;
         }
      }
}

// Vertical
if (place_meeting(x, y+vsp, o_entity_env_solid)){
    while(place_meeting(x,y+sign(vsp), o_entity_env_solid))
    {
        y -= sign(vsp);
        
        on_ground = true;
    }
} else {
    state = ENTITY_STATE.IDLE;
}

x += hsp;
y += vsp;
image_xscale = dir;

hsp = 0;
vsp = 0;