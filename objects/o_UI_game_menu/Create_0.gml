//set font
draw_set_font(global.Font_big);

//button variables
button_resume_str = ds_map_find_value(global.language_map, "STR_RESUME");

button_restart_str = ds_map_find_value(global.language_map, "STR_RESTART_GAME");

button_endgame_str = ds_map_find_value(global.language_map, "STR_END_GAME");

button_box_offset_h = 18;
button_box_offset_v = 10;
button_spacing = 6;
str_h = string_height(button_resume_str);		
button_h = str_h + button_box_offset_v + button_spacing;
button_w = sprite_get_width(spr_UI_main_button);

button_resume_x2 = room_width + button_w;
button_restart_x2 = room_width + button_w * 2;
button_endgame_x2 = room_width + button_w * 3;

button_slide_speed = button_endgame_x2  / (button_w * 0.5);
button_slideout_speed = 20;
button_slideout = false;

button_pressed = -1;
button_hovering = -1;
button_hovering_prev = -1;

//pause game
global.global_tick_timer = -1;
global.global_tick_interval = -1;

//achivement
ach = instance_nearest(x,y,o_UI_achievement);