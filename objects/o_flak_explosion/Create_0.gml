image_speed = 0;
image_angle = random_range(0,360);
playsound_flak = true;
tick_interval = 1;
tick_timer = tick_interval;

alpha_decay_speed = 0.05;

damage = 1;
hit_chance = 0.05;
blast_radius = 8;

//damage enemy
target_list = ds_list_create();
collision_circle_list(x,y,blast_radius,o_entity_enemy,false,true,target_list,false);

for (var i = 0; i < ds_list_size(target_list); i++) {
	var dice_hit = random_range(0,100);
					
	//hit animation if success
	if(dice_hit >= hit_chance * 100) {
		var _target = ds_list_find_value(target_list,i);
		with(_target) {
			hp -= other.damage;
		}
	}
}