draw_self();

//draw_muzzle_flash
if(image_index >= 10 and image_index <= 19) {
	draw_sprite(spr_flak_turret_muzzle_flash,image_index - 10,x,y);
}

//draw hit area
if(instance_exists(target_enemy) and debuging) {
	draw_circle(target_enemy.x,target_enemy.y,deviation,true);
}

//show health bar if hp changed
if(hp != hp_prev) {
	hp_prev = hp;
	
	health_bar_display_timer = health_bar_display_interval;
}

//display health bar is show health bar on
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
