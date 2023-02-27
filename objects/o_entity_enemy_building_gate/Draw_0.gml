draw_self();

if(hp != hp_prev) {
	hp_prev = hp;
	
	health_bar_display_timer = health_bar_display_interval;
}

if(health_bar_display_timer > 0) {
	health_bar_x1 = bbox_left - 1;
	health_bar_x2 = bbox_right -1;
	health_bar_y = bbox_top - 2;
	var percentage = 1 / hp_max * hp;
	draw_set_color(c_green);
	var x2 = (health_bar_x2 - health_bar_x1) * percentage;
	draw_line(health_bar_x1,health_bar_y,health_bar_x1 + x2,health_bar_y);
	draw_set_color(c_red);
	draw_line(health_bar_x1 + x2,health_bar_y,health_bar_x2,health_bar_y);
}

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

	orb_radius = sqrt(light_orb_area/pi) * 6;

	if(orb_radius < orb_radius_max)
		draw_circle(x - 1, y - 1, orb_radius ,false);
	else {
		instance_destroy();	
	}
