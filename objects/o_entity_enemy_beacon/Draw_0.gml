draw_self();

//draw flak shield						
draw_set_alpha(flak_deflecting_color_brightness/2 + 0.5);
draw_circle(x,y,flak_deflecting_range,false)
draw_circle_color((hit_area_left + hit_area_right) / 2,
					(hit_area_top + hit_area_bottom) /2,
					flak_deflecting_range, flak_deflecting_color_normal, flak_deflecting_color_bright, false);

//reset draw color and alpha
draw_set_alpha(1);
draw_set_color(c_white);