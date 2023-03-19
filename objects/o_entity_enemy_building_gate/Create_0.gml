/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

hp = 10000;
hp_max = hp;
hp_prev = hp;
health_bar_x1 = bbox_left;
health_bar_x2 = bbox_right -1;
health_bar_y = bbox_top + 2;
health_bar_display_interval = 30;
health_bar_display_timer = 0;

must_grounded = false;

//spawn data
spawn_interval = [30,15,300,1000,300];
spawn_timer = 0;
spawn_list = [o_entity_enemy_spider_smart,
				o_entity_enemy_launcher,
				o_entity_enemy_beacon,
				o_entity_enemy_building_gate,
				o_entity_enemy_ship_meteor];
spawn_weight = [100,100,5,1,10];
spawn_weight_total = 216;
spawn_next = o_entity_enemy_spider_smart;

//clear area that destroy block for spawn
clear_area_x = 8;
clear_area_y = 8;
clear_area_size = 8;

image_speed = 0;
var grid = instance_nearest(x,y,o_grid);

if(instance_exists(grid)) {
	x -= x mod grid_size;
	y -= y mod grid_size;
}

scr_death_animation_bigexplosion_create()