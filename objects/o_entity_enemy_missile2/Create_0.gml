/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

hp = 5;

damage = 5;
blast_radius = 4;
movespeed = 6;

turning_interval_warmup = 15;
turning_interval = 1;
turning_timer = turning_interval_warmup;
turning_speed = 8;

trail_interval = 1;
trail_timer = trail_interval;
trail_x = ds_list_create();
trail_y = ds_list_create();
trail_number = 10;

image_angle = 90;

target = noone;

decay = 300;

//bullet hit area
hit_area_left	= bbox_left;
hit_area_right	= bbox_right;
hit_area_top	= bbox_top;
hit_area_bottom = bbox_bottom;