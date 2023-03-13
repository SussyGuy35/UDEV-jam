draw_self();

//draw flak shield
var mix_color = merge_color(flak_deflecting_color_normal,
							flak_deflecting_color_bright,
							flak_deflecting_color_brightness);
							
draw_set_alpha(flak_deflecting_color_brightness/2 + 0.5);
draw_set_color(mix_color);
draw_circle(x,y,flak_deflecting_range,false)
draw_circle_color((hit_area_left + hit_area_right) / 2,
					(hit_area_top + hit_area_bottom) /2,
					flak_deflecting_range, mix_color, flak_deflecting_color_bright, false);

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

//reset draw color and alpha
draw_set_alpha(1);
draw_set_color(c_white);