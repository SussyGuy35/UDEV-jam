if(button_hovering_prev != button_hovering and button_hovering != -1) {
	button_hovering_prev = button_hovering;
	playsound_button_hover = true;
}
button_hovering = -1;

if(button_endgame_x2 > room_width) {
	button_resume_x2 -= button_slide_speed;
	button_restart_x2 -= button_slide_speed;
	button_endgame_x2 -= button_slide_speed;
	button_slide_speed = button_endgame_x2 / (button_w * 0.5);
}

if(button_resume_x2 < room_width) button_resume_x2 = room_width;
if(button_restart_x2 < room_width) button_restart_x2 = room_width;
if(button_endgame_x2 < room_width) button_endgame_x2 = room_width;

if(button_slideout) {
	button_resume_x2 += button_slideout_speed;
	if(button_resume_x2 > room_width + button_w / 2)
		button_restart_x2 += button_slideout_speed;
	if(button_restart_x2 > room_width + button_w / 2)
		button_endgame_x2 += button_slideout_speed;
}

//set font
draw_set_font(global.Font_big);
draw_set_halign(fa_right);

//draw new game button
var text_x = button_resume_x2 - button_box_offset_h;
var text_y = y + button_h * 0;
var bw = sprite_get_width(spr_UI_main_button);
var bh = sprite_get_height(spr_UI_main_button);
var bx = text_x - bw + button_box_offset_h;
var by = text_y - button_box_offset_v;
var hovering = 0;
if(mouse_x >= bx and mouse_x < bx + bw and mouse_y >= by and mouse_y <= by + bh) {
	if(mouse_check_button(mb_left)) {
		button_pressed = 0;
	} else hovering = 1;
	button_hovering = 0;
}
draw_sprite(spr_UI_main_button,hovering,bx,by);
draw_text(text_x, text_y,button_resume_str);

//draw restart button
var text_x = button_restart_x2 - button_box_offset_h;
var text_y = y + button_h * 1;
var bw = sprite_get_width(spr_UI_main_button);
var bh = sprite_get_height(spr_UI_main_button);
var bx = text_x - bw + button_box_offset_h;
var by = text_y - button_box_offset_v;
var hovering = 0;
if(mouse_x >= bx and mouse_x < bx + bw and mouse_y >= by and mouse_y <= by + bh) {
	if(mouse_check_button(mb_left)) {
		button_pressed = 1;
	} else hovering = 1;
	button_hovering = 1;
	
}
draw_sprite(spr_UI_main_button,hovering,bx,by);
draw_text(text_x, text_y,button_restart_str);

//draw endgame button
var text_x = button_endgame_x2 - button_box_offset_h;
var text_y = y + button_h * 2;
var bw = sprite_get_width(spr_UI_main_button);
var bh = sprite_get_height(spr_UI_main_button);
var bx = text_x - bw + button_box_offset_h;
var by = text_y - button_box_offset_v;
var hovering = 0;
if(mouse_x >= bx and mouse_x < bx + bw and mouse_y >= by and mouse_y <= by + bh) {
	if(mouse_check_button(mb_left)) {
		button_pressed = 2;
	} else hovering = 1;
	button_hovering = 2;
}
draw_sprite(spr_UI_main_button,hovering,bx,by);
draw_text(text_x, text_y,button_endgame_str);

//draw reset
draw_set_halign(fa_left);

if (mouse_check_button_released(mb_left)) {
	switch (button_pressed) {
		case 0:
			button_slideout = true;
			alarm_set(0,30);
			playsound_button_pressed = true;
			break;
		case 1:
			with(instance_create_layer(0,0,"Instances",o_UI_confirm)) {
				alarm_index = 1;
				alarm_interval = 60;
				host = other;
			}
			playsound_button_pressed = true;
			break;
		case 2:
			with(instance_create_layer(0,0,"Instances",o_UI_confirm)) {
				userevent_index = 2;
				host = other;
			}
			playsound_button_pressed = true;
			break;
		default:
			break;
	}
}

if(button_hovering == -1) button_pressed = -1