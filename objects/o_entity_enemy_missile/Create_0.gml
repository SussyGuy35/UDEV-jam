/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

hp = 5;

damage = 101;
blast_radius = 4;

turning_interval_warmup = 30;
turning_interval = 10;
turning_timer = turning_interval_warmup;

trail_interval = 2;
trail_timer = trail_interval;

image_angle = 90;

target = noone;

//bullet hit area
hit_area_left	= bbox_left;
hit_area_right	= bbox_right;
hit_area_top	= bbox_top;
hit_area_bottom = bbox_bottom;