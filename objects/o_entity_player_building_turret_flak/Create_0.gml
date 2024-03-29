/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();
global.flak_cannon_created++;
hp = 100;
hp_max = hp;
hp_prev = hp;
health_bar_x1 = bbox_left;
health_bar_x2 = bbox_right -1;
health_bar_y = bbox_top + 2;
health_bar_display_interval = 30;
health_bar_display_timer = 0;

must_grounded = true;

//spawn data
spawn_interval = 300;
spawn_timer = spawn_interval;

//clear area that destroy block for spawn
clear_area_x = 8;
clear_area_y = 8;
clear_area_size = 8;

image_speed = 0;

//enemy data
spotted_enemies = ds_list_create();
target_enemy = noone;

//flak turret data
flak_dir = 0;
soldier_occupied = false;
soldier_health = 0;
max_range = 600;
min_range = 10;
angle_deviation = 10;
deviation = 0;
state = ENTITY_STATE.IDLE;
