/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

hp = 200;
hp_max = hp;
hp_prev = hp;
health_bar_x1 = bbox_left;
health_bar_x2 = bbox_right -1;
health_bar_y = bbox_top + 2;
health_bar_display_interval = 30;
health_bar_display_timer = 0;
image_speed = 0;

//meteor spawning
meteor_spawn_interval = 30;
meteor_spawn_timer = 150;
meteor_spawn_interval_deviation = 15;
meteor_spawn_y = -10;

//flak deflecting
flak_deflecting_range = 32;
flak_deflecting_chance = 0.5;
flak_deflecting_hsp = 2;
flak_deflecting_length = 1;
flak_deflecting_color_brightness = 0;
flak_deflecting_color_brightness_decay = 0.05;
flak_deflecting_color_normal = c_teal;
flak_deflecting_color_bright = c_white;