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

must_grounded = true;

state = ENTITY_STATE.IDLE;

//contruction data
construction_range = 120;
speed_contruction = 4;
construction_interval = 25;
construction_timer = construction_interval;
construction_target = noone;

//door data
door_close_max = 7;
door_close = door_close_max;
door_speed = 1;
door_to_open = false;

//animation
ani_idle_start = 0;
ani_idle_end = 4;
ani_door_open_start = 5;
ani_door_open_end = 11;
ani_door_close_start = 12;
ani_door_close_end = 19;
ani_con_start = 20;
ani_con_end = 43;

//clear area that destroy block for spawn
clear_area_x = 8;
clear_area_y = 8;
clear_area_size = 8;

image_speed = 0;
