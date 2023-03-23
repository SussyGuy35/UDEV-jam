function scr_soldier_shooting(f_dir, image_i, look_to_right) {
	if(look_to_right) dir = 1; else dir = -1;
	
	if(image_index = image_i) {
			image_index++;
					
			//muzzle flash effect
			fire_dir = f_dir;
			muzzle_flashing = true;
					
			//roll hit chance
			dice_hit = random_range(0,1);
					
			//hit animation if success
			if(dice_hit >= hit_chance) {
				//get a random bullet hit location
				var hit_x = irandom_range(target_enemy.hit_area_left,target_enemy.hit_area_right);
				var hit_y = irandom_range(target_enemy.hit_area_top, target_enemy.hit_area_bottom);
				
				//create bullet hit graphic effect
				instance_create_layer(hit_x,hit_y,"Bullets",o_gfx_bullet_hit);
				
				//apply damage, notify victim the killer, reset target_enemy if they died
				target_enemy.hp -= damage;
				if(target_enemy.hp = 0) {
					target_enemy.killed_by = self;
					target_enemy = noone;
					with(instance_find(o_UI_achievement,0)) {
						if(other.instruction_direction == INSTRUCTION_DIRECTION.JETPACK) {
							global.jetpack_kill++;
						}
					}
				} else if(target_enemy.hp < 0) {
					target_enemy = noone;
					with(instance_find(o_UI_achievement,0)) {
						if(other.instruction_direction == INSTRUCTION_DIRECTION.JETPACK) {
							global.jetpack_kill++;
						}
					}
				}
			}
	} else {
		image_index = image_i;
		muzzle_flashing = false;
	}
}