draw_self();


	light_orb_area = 0;
	for (var i = 0; i < ds_list_size(particle_x); i++) {
		draw_set_color(c_white);
		draw_set_alpha(1);
		var px = ds_list_find_value(particle_x,i);
		var py = ds_list_find_value(particle_y,i);
	
		draw_sprite(spr_bullet_hit,0,px,py);
	
		if(px == x - 1 and py == y - 1) {
			light_orb_area++;
		}
	}

	orb_radius = sqrt(light_orb_area/pi) * 3;

	if(orb_radius < orb_radius_max)
		draw_circle(x - 1, y - 1, orb_radius ,false);
	else {
		instance_destroy();	
	}
