image_index = mute;

//mouse_position
var mx = mouse_x;
var my = mouse_y;

if(mx >= x and mx <= x + 8 
	and my >= y and my <= y + 8) {
	if(mouse_check_button_pressed(mb_left)) {
		playsound_button_pressed = true;
		if(mute) {
			mute = false;
			
			sound_gunshot_play = false;
			playsound_missile_explode = false;
			playsound_missile_launch = false;
			playsound_contruction = false;
			playsound_soldier_die = false;
			playsound_explosion0 = false;
			playsound_explosion1 = false;
			playsound_button_pressed = false;
			playsound_button_hover = false;
			playsound_gun0 = false;
			playsound_flak = false;
		} else mute = true;
	}

	//scr_language_draw_UI_text_box(ds_map_find_value(global.language_map,"STR_MUTE"));
	//scr_language_draw_UI_text_box("!\u22#$%&'[]*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ")
}