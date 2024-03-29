image_speed = 0;
image_angle = random_range(0,360);
playsound_flak = true;
tick_interval = 1;
tick_timer = tick_interval;

alpha_decay_speed = 0.05;

damage = 1;
hit_chance = 0.1;
blast_radius = 8;
repelled = false;

var beacon = instance_nearest(x,y,o_entity_enemy_beacon);
if(instance_exists(beacon)) {
	for (var i = 0; i < beacon.flak_deflecting_range; i++) {
		var dice_hit = random_range(0,1);
		var distance = point_distance(x,y,beacon.x,beacon.y);
		if(beacon.flak_deflecting_chance > dice_hit 
			and distance < beacon.flak_deflecting_range) {
				var dir = point_direction(beacon.x,beacon.y,x,y);
				x += lengthdir_x(beacon.flak_deflecting_length,dir);
				y += lengthdir_x(beacon.flak_deflecting_length,dir) + beacon.flak_deflecting_hsp;
		}
	}
	beacon.flak_deflecting_color_brightness += beacon.flak_deflecting_color_brightness_decay;
	if(beacon.flak_deflecting_color_brightness > 1) beacon.flak_deflecting_color_brightness = 1;
}

repelled = true;