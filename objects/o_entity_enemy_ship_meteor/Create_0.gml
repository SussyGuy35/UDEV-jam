/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

hp = 1000;
hp_max = hp;
hp_prev = hp;
health_bar_x1 = bbox_left;
health_bar_x2 = bbox_right -1;
health_bar_y = bbox_top + 2;
health_bar_display_interval = 30;
health_bar_display_timer = 0;
image_speed = 0;

//hatch
hatch_closing = false;
hatch_opening = -1;
hatch_opening_max = 6;
hatch_speed = 0.25;
hatch_cooldown_interval = 150;
hatch_cooldown_timer = 75;

//weapon
mainwp_burst_number = 4;
mainwp_burst_index = 4;
mainwp_fire_interval = 2;
mainwp_fire_timer = 2;
mainwp_x = -8;
mainwp_y = -5;

subwp_x = [4,6,8,10,12,14];
subwp_y = -7
subwp_index = 0;
subwp_number = 6;
subwp_fire_interval = 8;
subwp_fire_timer = 0;

target_list = ds_list_create();

scr_death_animation_bigexplosion_create()

