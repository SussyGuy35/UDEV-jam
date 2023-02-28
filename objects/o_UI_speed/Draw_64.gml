var mx = mouse_x;
var my = mouse_y;

mouse_hovering = false;
for(var i = 0; i < 5; i++) {
	var x1 = x + button_spacing * i;
	var x2 = x1 + button_size - 1;
	var y1 = y;
	var y2 = y + button_size - 1;
	
	if(mx >= x1 and mx <= x2 and my >= y1 and my <= y2) { //if mouse is hovering on the button
		mouse_hovering = true;
		
		if(i < 2) { //if button is speed slow or slowest
			draw_sprite(spr_button_speed,i,x1,y1);
				
			if(mouse_check_button_pressed(mb_left)) {
				if(i == 0) {
					playsound_button_pressed = true;
					global.global_tick_timer = speed_slowest;
					global.global_tick_interval = speed_slowest;
				} else if (i == 1) {
					playsound_button_pressed = true;
					global.global_tick_timer = speed_slow;
					global.global_tick_interval = speed_slow;
				}
			}
		} else if (i == 2) { //if button is play or pause
			if (global.global_tick_interval >= 0) {
				draw_sprite(spr_button_speed,3,x1,y1);
			} else draw_sprite(spr_button_speed,2,x1,y1);
			
			if(mouse_check_button_pressed(mb_left)) {
				if (global.global_tick_interval >= 0) {
					playsound_button_pressed = true;
					global.global_tick_timer = -1;
					global.global_tick_interval = -1;
				} else {
					playsound_button_pressed = true;
					global.global_tick_timer = speed_normal;
					global.global_tick_interval = speed_normal;
				}
			}
		} else if (i > 2) {
			draw_sprite(spr_button_speed,i+1,x1,y1);
			
			if(mouse_check_button_pressed(mb_left)) {
				if (i == 3) {
					playsound_button_pressed = true;
					global.global_tick_timer = speed_fast;
					global.global_tick_interval = speed_fast;
				} else if (i == 4) {
					playsound_button_pressed = true;
					global.global_tick_timer = speed_fastest;
					global.global_tick_interval = speed_fastest;
				}
			}
		}
	} else {	
		if(i < 2) {
			if(global.global_tick_interval == speed_slowest and i == 0) {
				draw_sprite(spr_button_speed,12,x1,y1);
			} else if(global.global_tick_interval == speed_slow and i == 1) {
				draw_sprite(spr_button_speed,13,x1,y1);
			} else {
				draw_sprite(spr_button_speed,i + 6,x1,y1);
			}
		} else if (i == 2) {
			if(global.global_tick_interval == speed_normal) {
				draw_sprite(spr_button_speed,14,x1,y1);
			} else if(global.global_tick_interval < 0) {
				draw_sprite(spr_button_speed,15,x1,y1);
			} else {
				if(global.global_tick_interval < 0) {
					draw_sprite(spr_button_speed,9,x1,y1);
				} else {
					draw_sprite(spr_button_speed,8,x1,y1);
				}
			}
		} else if (i > 2) {
			if(global.global_tick_interval == speed_fast and i == 3) {
				draw_sprite(spr_button_speed,16,x1,y1);
			} else if(global.global_tick_interval == speed_fastest and i == 4) {
				draw_sprite(spr_button_speed,17,x1,y1);
			} else {
				draw_sprite(spr_button_speed,i + 7,x1,y1);
			}
		}
	}
}

//play button hovering sound if needed
if(mouse_hovering != mouse_hovering_prev and mouse_hovering) {
	playsound_button_hover = true;
}
mouse_hovering_prev = mouse_hovering;