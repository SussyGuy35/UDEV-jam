// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_death_animation_bigexplosion_draw(){
	var cen_x = (bbox_left + bbox_right) / 2;
	var cen_y = (bbox_top + bbox_bottom) / 2;
	if(vline_speed < vline_speed_max) {
		light_orb_area = 0;
		for (var i = 0; i < ds_list_size(particle_x); i++) {
			draw_set_color(c_white);
			draw_set_alpha(1);
			var px = ds_list_find_value(particle_x,i);
			var py = ds_list_find_value(particle_y,i);
	
			draw_sprite(spr_bullet_hit,0,px,py);
			
			var dis = point_distance(px,py,cen_x,cen_y);
	
			if(dis < 2) {
				light_orb_area++;
			}
		}
	}

	orb_radius = sqrt(light_orb_area/pi) * 6;

	if(orb_radius < orb_radius_max)
		draw_circle(cen_x, cen_y, orb_radius ,false);
	else {
		if(vline_speed >= vline_speed_max) {
			if(!explosion_played) {
				playsound_explosion0 = true;
				explosion_played = true;
			}
			draw_set_color(c_white);
			draw_set_alpha(flash_timer/flash_interval);
			draw_rectangle(0,0,room_width,room_height,false)
			image_alpha = 0;
			flash_timer--;
			if(flash_timer == 0) {
				draw_set_alpha(1);
				instance_destroy();
			}
		} else {
			image_alpha = 0;
			var w = ellipse_w2 + (ellipse_w2 - ellipse_w1) * (vline_speed/vline_speed_max);
			var h = ellipse_h2 + (ellipse_h2 - ellipse_h1) * (vline_speed/vline_speed_max);
			draw_ellipse(x - w, y - h, x + w, y + h, false);
			
			var x_offset = room_width * vline_speed/vline_speed_max;
			draw_line(x - x_offset, y, x+x_offset, y);
			vline_speed++;
		}
	}
}