room_w_mid = room_width / 2;
spacing_short = 16;
spacing_long = 24;

title_str = ds_map_find_value(global.language_map, "STR_SETTING");
title_y = 48;

volume_str = ds_map_find_value(global.language_map, "STR_VOLUME_MASTER");
volume_y = title_y + spacing_long;
volume_bar_w = sprite_get_width(spr_UI_setting_volumebar);
volume_bar_h = sprite_get_height(spr_UI_setting_volumebar);
volume_master_x = room_w_mid - volume_bar_w * 10; 
volume_master_y = volume_y + spacing_short;

sound_str = ds_map_find_value(global.language_map, "STR_VOLUME_SOUND");
sound_y = volume_master_y + spacing_long;
sound_bar_y = sound_y + spacing_short;

resolution_str = ds_map_find_value(global.language_map, "STR_RESOLUTION");
resolution_y = sound_bar_y + spacing_long;

res_x = room_w_mid - volume_bar_w * 5;
res_full_str = ds_map_find_value(global.language_map, "STR_FULLSCREEN");
res_full_y = resolution_y + spacing_short;

res_s_str = ds_map_find_value(global.language_map, "STR_SCREEN_S");
res_s_y = res_full_y + spacing_short;

res_m_str = ds_map_find_value(global.language_map, "STR_SCREEN_M");
res_m_y = res_s_y + spacing_short;

res_l_str = ds_map_find_value(global.language_map, "STR_SCREEN_L");
res_l_y = res_m_y + spacing_short;

switch_size = sprite_get_width(spr_UI_switch_button);
switch_offset_x = -4 - switch_size;

was_hovering = false;

back_str = ds_map_find_value(global.language_map, "STR_BACK");
back_y = res_l_y  + spacing_long;