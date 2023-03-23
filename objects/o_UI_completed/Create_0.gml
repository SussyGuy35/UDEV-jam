host = noone;
alarm_index = -1;
alarm_interval = 60;
userevent_index = -1;

draw_set_font(global.Font);
str = ds_map_find_value(global.language_map, "STR_COMPLETION");
str_yes = ds_map_find_value(global.language_map, "STR_OK");

string_h = string_height(str);
string_w = string_width(str); //(char_w - 1) * string_length(str);

text_offset = 4;

button_w = sprite_get_width(spr_UI_button_yesno);
button_h = sprite_get_height(spr_UI_button_yesno);
button_half_spacing = 4;

box_w = string_w + text_offset * 2;
box_h = string_h + text_offset * 2 + button_h;
	
//align_left = true;
//align_top = true;
room_mid_h = room_height / 2;
room_mid_w = room_width / 2;

x1 = room_mid_w - box_w/2;
x2 = room_mid_w + box_w/2;
y1 = room_mid_h - box_h/2;
y2 = room_mid_h + box_h/2;

text_origin_x = x1 + text_offset;
text_origin_y = y1 + text_offset;

press_at = -1; //0 = no, 1 = yes;
hovering = false;

ach = instance_nearest(x,y,o_UI_achievement);
playsound_echoDing = true;
audio_stop_sound(music);
music = music = audio_play_sound(music_frozentape_spacey,0,true,volume * volume_music);