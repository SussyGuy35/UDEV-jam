draw_self();

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

//draw construction range
if(debuging) draw_circle(x,y,construction_range,true);