//set font
draw_set_font(global.Font_big);
draw_set_halign(fa_middle);

//draw title
draw_text(room_w_mid,title_y, title_str);

//draw master volume
draw_set_font(global.Font);
draw_text(room_w_mid,volume_y, volume_str);
var volume_bar_on = volume * 10;
for(var i = 0; i < 20; i++) {
	if(volume_bar_on <= i) var spr_i = 1; else spr_i = 0;
	draw_sprite(spr_UI_setting_volumebar,spr_i,volume_master_x + volume_bar_w*i,volume_master_y);
}

if(mouse_check_button_pressed(mb_left)) {
	if(mouse_x >= volume_master_x 
		and mouse_x <= volume_master_x + volume_bar_w*20 
		and mouse_y >= volume_master_y
		and mouse_y <= volume_master_y + volume_bar_h)
	{
		volume = (mouse_x - room_w_mid + volume_bar_w * 10) / volume_bar_w / 10;
		scr_config_update("sounds","volume",volume);
		show_debug_message("volume: " + string(volume));
		playsound_missile_explode = true;
	}
}

//draw sound volume
draw_text(room_w_mid,sound_y, sound_str);
var volume_bar_on = volume_sound * 10;
for(var i = 0; i < 20; i++) {
	if(volume_bar_on <= i) var spr_i = 1; else spr_i = 0;
	draw_sprite(spr_UI_setting_volumebar,spr_i,volume_master_x + volume_bar_w*i,sound_bar_y);
}

if(mouse_check_button_pressed(mb_left)) {
	if(mouse_x >= volume_master_x 
		and mouse_x <= volume_master_x + volume_bar_w*20 
		and mouse_y >= sound_bar_y
		and mouse_y <= sound_bar_y + volume_bar_h)
	{
		volume_sound = (mouse_x - room_w_mid + volume_bar_w * 10) / volume_bar_w / 10;
		scr_config_update("sounds","volume",volume_sound);
		show_debug_message("volume: " + string(volume_sound));
		playsound_missile_explode = true;
	}
}

var hovering_at_one = false;
//draw resolution
draw_set_font(global.Font_big);
draw_text(room_w_mid,resolution_y, resolution_str);

draw_set_halign(fa_left);
draw_set_font(global.Font);

//fullscreen switch
var swx1 = res_x + switch_offset_x;
var swx2 = swx1 + switch_size + string_width(res_full_str);
var swy1 = res_full_y;
var swy2 = swy1 + switch_size;
var hovering = false;
if(mouse_x >= swx1 and mouse_x <= swx2 and mouse_y >= swy1 and mouse_y <= swy2) {
	hovering = true;
	hovering_at_one = true;
	if(mouse_check_button_pressed(mb_left)) {
		playsound_button_pressed = true;
		if(fullscreen) fullscreen = 0; else fullscreen = 1;
		window_set_fullscreen(fullscreen);
		scr_config_update("graphics","fullscreen",1);
	}
}
if(window_get_fullscreen()) {
	if(hovering) draw_sprite_ext(spr_UI_switch_button,1,swx1,swy1,1,1,0,c_yellow,1);
		else draw_sprite_ext(spr_UI_switch_button,1,swx1,swy1,1,1,0,c_white,1);
} else {
	if(hovering) draw_sprite_ext(spr_UI_switch_button,0,swx1,swy1,1,1,0,c_yellow,1);
		else draw_sprite_ext(spr_UI_switch_button,0,swx1,swy1,1,1,0,c_white,1);
}
if(hovering) draw_set_color(c_yellow); else draw_set_color(c_white);
draw_text(res_x,res_full_y, res_full_str);

//small resolution switch
var swx1 = res_x + switch_offset_x;
var swx2 = swx1 + switch_size + string_width(res_s_str);
var swy1 = res_s_y;
var swy2 = swy1 + switch_size;
var hovering = false;
if(mouse_x >= swx1 and mouse_x <= swx2 and mouse_y >= swy1 and mouse_y <= swy2) {
	hovering = true;
	hovering_at_one = true;
	if(mouse_check_button_pressed(mb_left)) {
		playsound_button_pressed = true;
		fullscreen = 0;
		window_set_fullscreen(fullscreen);
		scr_config_update("graphics","fullscreen",1);
		
		window_scale = 1;
		scr_config_update("graphics","window_scale",1);
		window_set_size(view_width * window_scale,view_height * window_scale);
	}
}
if(!window_get_fullscreen() and window_scale == 1) {
	if(hovering) draw_sprite_ext(spr_UI_switch_button,1,swx1,swy1,1,1,0,c_yellow,1);
		else draw_sprite_ext(spr_UI_switch_button,1,swx1,swy1,1,1,0,c_white,1);
} else {
	if(hovering) draw_sprite_ext(spr_UI_switch_button,0,swx1,swy1,1,1,0,c_yellow,1);
		else draw_sprite_ext(spr_UI_switch_button,0,swx1,swy1,1,1,0,c_white,1);
}
if(hovering) draw_set_color(c_yellow); else draw_set_color(c_white);
draw_text(res_x,res_s_y, res_s_str);

//medium resolution switch
var swx1 = res_x + switch_offset_x;
var swx2 = swx1 + switch_size + string_width(res_m_str);
var swy1 = res_m_y;
var swy2 = swy1 + switch_size;
var hovering = false;
if(mouse_x >= swx1 and mouse_x <= swx2 and mouse_y >= swy1 and mouse_y <= swy2) {
	hovering = true;
	hovering_at_one = true;
	if(mouse_check_button_pressed(mb_left)) {
		playsound_button_pressed = true;
		fullscreen = 0;
		window_set_fullscreen(fullscreen);
		scr_config_update("graphics","fullscreen",1);
		
		window_scale = 2;
		scr_config_update("graphics","window_scale",2);
		window_set_size(view_width * window_scale,view_height * window_scale);
	}
}
if(!window_get_fullscreen() and window_scale == 2) {
	if(hovering) draw_sprite_ext(spr_UI_switch_button,1,swx1,swy1,1,1,0,c_yellow,1);
		else draw_sprite_ext(spr_UI_switch_button,1,swx1,swy1,1,1,0,c_white,1);
} else {
	if(hovering) draw_sprite_ext(spr_UI_switch_button,0,swx1,swy1,1,1,0,c_yellow,1);
		else draw_sprite_ext(spr_UI_switch_button,0,swx1,swy1,1,1,0,c_white,1);
}
if(hovering) draw_set_color(c_yellow); else draw_set_color(c_white);
draw_text(res_x,res_m_y, res_m_str);

//large resolution switch
var swx1 = res_x + switch_offset_x;
var swx2 = swx1 + switch_size + string_width(res_l_str);
var swy1 = res_l_y;
var swy2 = swy1 + switch_size;
var hovering = false;
if(mouse_x >= swx1 and mouse_x <= swx2 and mouse_y >= swy1 and mouse_y <= swy2) {
	hovering = true;
	hovering_at_one = true;
	if(mouse_check_button_pressed(mb_left)) {
		playsound_button_pressed = true;
		fullscreen = 0;
		window_set_fullscreen(fullscreen);
		scr_config_update("graphics","fullscreen",1);
		
		window_scale = 3;
		scr_config_update("graphics","window_scale",3);
		window_set_size(view_width * window_scale,view_height * window_scale);
	}
}
if(!window_get_fullscreen() and window_scale == 3) {
	if(hovering) draw_sprite_ext(spr_UI_switch_button,1,swx1,swy1,1,1,0,c_yellow,1);
		else draw_sprite_ext(spr_UI_switch_button,1,swx1,swy1,1,1,0,c_white,1);
} else {
	if(hovering) draw_sprite_ext(spr_UI_switch_button,0,swx1,swy1,1,1,0,c_yellow,1);
		else draw_sprite_ext(spr_UI_switch_button,0,swx1,swy1,1,1,0,c_white,1);
}
if(hovering) draw_set_color(c_yellow); else draw_set_color(c_white);
draw_text(res_x,res_l_y, res_l_str);

//back button
draw_set_halign(fa_middle);
draw_set_font(global.Font_big);
var str_w = string_width(back_str);
var str_h = string_height(back_str);
var x1 = room_w_mid - str_w / 2;
var x2 = room_w_mid + str_w / 2;
var y1 = back_y;
var y2 = y1 + str_h;
var hovering = false;

if(mouse_x >= x1 and mouse_x <= x2 and mouse_y >= y1 and mouse_y <= y2) {
	hovering = true;
	hovering_at_one = true;
	if(mouse_check_button_pressed(mb_left)) {
		event_user(0);
	}
}
if(hovering) draw_set_color(c_yellow); else draw_set_color(c_white);
draw_text(room_w_mid,back_y, back_str);

if(was_hovering != hovering_at_one) {
	was_hovering = hovering_at_one;
	playsound_button_hover = true;
}
draw_set_color(c_white);
draw_set_halign(fa_left);