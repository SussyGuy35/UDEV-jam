/*
	Name: scr_soldier_shooting
	input:
		f_dir: 
			the fire direction 
			which is the correct frame of the sprite spr_soldier_muzzle_flash
			corresponding to the gun pointing direction
		image_i:
			the image_index of the sprite 
			that show the soldier pointing the gun 
			at the correct angle
		look_to_right: (bool variable)
			if it's true: 
				dir = 1, the object's sprite won't flip
			else:
				dir = -1, flip the object sprite
	Purpose:
		change image index of soldier to pointing gun at the target enemy
		enable muzzle flash graphic effect
		roll hit chance and apply damage on target enemy if success
		create bullet hit graphic effect if damage apply
		notify victim of who killed them
		reset target enemy pointer if they died
	
*/

function scr_knight_melee(f_dir, image_i, look_to_right){
	if(look_to_right) dir = 1; else dir = -1;
	
	attack_timer--;
	if(attack_timer <= 0) {
		attack_timer = attack_interval;
		
		if(image_index != image_i) image_index = image_i; else image_index++;
		

		//muzzle flash effect
		fire_dir = f_dir;
		muzzle_flashing = true;
		sound_gunshot_play = true;
					
		//get a random bullet hit location
		var hit_x = irandom_range(target_enemy.hit_area_left,target_enemy.hit_area_right);
		var hit_y = irandom_range(target_enemy.hit_area_top, target_enemy.hit_area_bottom);
				
		//create bullet hit graphic effect
		instance_create_layer(hit_x,hit_y,"Bullets",o_gfx_sword_hit);
				
		//apply damage, notify victim the killer, reset target_enemy if they died
		target_enemy.hp -= damage;
		target_enemy.stun_timer = stun_power;
		var knockback_dir = point_direction(x,y,target_enemy.x,target_enemy.y);
		target_enemy.knockback_x += lengthdir_x(knockback,knockback_dir);
		target_enemy.knockback_y += lengthdir_y(knockback,knockback_dir);
			
		if(target_enemy.hp = 0) {
			target_enemy.killed_by = self;
			target_enemy = noone;
		} else if(target_enemy.hp < 0) {
			target_enemy = noone;
		}
	}
}