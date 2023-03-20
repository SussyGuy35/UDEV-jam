if(loading) {
	draw_set_color(c_black);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_font(global.Font_big);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(room_width/2,room_height/2,ds_map_find_value(global.language_map, "STR_LOADING"));
}