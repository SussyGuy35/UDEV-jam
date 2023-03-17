//set font
draw_set_font(global.Font_big);
draw_set_halign(fa_middle);

draw_text(room_w_mid,title_y, "SETTING");

draw_set_font(global.Font);
draw_text(room_w_mid,title_volume_y, "Master Volume");
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
		show_debug_message("volume: " + string(volume));
		playsound_missile_explode = true;
	}
}