//set font
draw_set_font(global.Font_big);

//button variables
button_newgame_str = ds_map_find_value(global.language_map, "STR_NEWGAME");

button_setting_str = ds_map_find_value(global.language_map, "STR_SETTING");

button_exit_str = ds_map_find_value(global.language_map, "STR_EXIT");


button_box_offset_h = 18;
button_box_offset_v = 10;
button_spacing = 6;
str_h = string_height(button_newgame_str);		
button_h = str_h + button_box_offset_v + button_spacing;
button_w = sprite_get_width(spr_UI_main_button);

button_newgame_x2 = room_width + button_w;
button_setting_x2 = room_width + button_w * 2;
button_exit_x2 = room_width + button_w * 3;

button_slide_speed = button_exit_x2  / (button_w * 0.5);
button_slideout_speed = 20;
button_slideout = false;

button_pressed = -1;
button_hovering = -1;
button_hovering_prev = -1;