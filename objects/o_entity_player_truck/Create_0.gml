/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

hp = 100;
hp_max = hp;
hp_prev = hp;
health_bar_x1 = bbox_left;
health_bar_x2 = bbox_right -1;
health_bar_y = bbox_top + 2;
health_bar_display_interval = 30;
health_bar_display_timer = 0;

distance_traveled = 0;
distance_per_soldier_spawn = 300;

road_blocked = false;
road_blocked_message_interval = 15;
road_blocked_message_timer = 0;
road_blocked_message_on = false;