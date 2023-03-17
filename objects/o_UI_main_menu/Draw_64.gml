if(button_hovering_prev != button_hovering and button_hovering != -1) {
	button_hovering_prev = button_hovering;
	playsound_button_hover = true;
}
button_hovering = -1;

if(button_exit_x2 > room_width) {
	button_newgame_x2 -= button_slide_speed;
	button_setting_x2 -= button_slide_speed;
	button_credit_x2 -= button_slide_speed;
	button_exit_x2 -= button_slide_speed;
	button_slide_speed = button_exit_x2 / (button_w * 0.5);
}

if(button_newgame_x2 < room_width) button_newgame_x2 = room_width;
if(button_setting_x2 < room_width) button_setting_x2 = room_width;
if(button_credit_x2 < room_width) button_credit_x2 = room_width;
if(button_exit_x2 < room_width) button_exit_x2 = room_width;

if(button_slideout) {
	button_newgame_x2 += button_slideout_speed;
	if(button_newgame_x2 > room_width + button_w / 2)
		button_setting_x2 += button_slideout_speed;
	if(button_setting_x2 > room_width + button_w / 2)
		button_credit_x2 += button_slideout_speed;
	if(button_credit_x2 > room_width + button_w / 2)
		button_exit_x2 += button_slideout_speed;
}

//set font
draw_set_font(global.Font_big);
draw_set_halign(fa_right);

//draw new game button
var text_x = button_newgame_x2 - button_box_offset_h;
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
draw_text(text_x, text_y,button_newgame_str);

//draw setting button
var text_x = button_setting_x2 - button_box_offset_h;
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
draw_text(text_x, text_y,button_setting_str);

//draw credit button
var text_x = button_credit_x2 - button_box_offset_h;
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
draw_text(text_x, text_y,button_credit_str);

//draw exit button
var text_x = button_exit_x2 - button_box_offset_h;
var text_y = y + button_h * 3;
var bw = sprite_get_width(spr_UI_main_button);
var bh = sprite_get_height(spr_UI_main_button);
var bx = text_x - bw + button_box_offset_h;
var by = text_y - button_box_offset_v;
var hovering = 0;
if(mouse_x >= bx and mouse_x < bx + bw and mouse_y >= by and mouse_y <= by + bh) {
	if(mouse_check_button(mb_left)) {
		button_pressed = 3;
	} else hovering = 1;
	button_hovering = 3;
}
draw_sprite(spr_UI_main_button,hovering,bx,by);
draw_text(text_x, text_y,button_exit_str);

//draw reset
draw_set_halign(fa_left);

if (mouse_check_button_released(mb_left)) {
	switch (button_pressed) {
		case 0:
			button_slideout = true;
			alarm_set(0,60);
			playsound_button_pressed = true;
			break;
		case 1:
			button_slideout = true;
			alarm_set(1,60);
			playsound_button_pressed = true;
			break;
		case 2:
			button_slideout = true;
			alarm_set(2,60);
			playsound_button_pressed = true;
			break;
		case 3:
			button_slideout = true;
			alarm_set(3,60);
			playsound_button_pressed = true;
			break;
		default:
			break;
	}
}

if(button_hovering == -1) button_pressed = -1