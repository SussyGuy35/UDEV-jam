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

//reset draw color and alpha
draw_set_alpha(1);
draw_set_color(c_white);