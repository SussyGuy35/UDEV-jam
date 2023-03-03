/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

hp = 500;
hp_max = hp;
hp_prev = hp;
health_bar_x1 = bbox_left;
health_bar_x2 = bbox_right -1;
health_bar_y = bbox_top + 2;
health_bar_display_interval = 30;
health_bar_display_timer = 0;

must_grounded = true;

truck_respawn_interval = 600;
truck_respawn_timer = 0;
truck_id = noone;

image_speed = 0;
image_alpha = 1;