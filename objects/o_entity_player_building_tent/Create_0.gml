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

//spawn data
spawn_interval = 300;
spawn_timer = spawn_interval;

//clear area that destroy block for spawn
clear_area_x = 8;
clear_area_y = 8;
clear_area_size = 8;

image_speed = 0;
var grid = instance_nearest(x,y,o_grid);

if(instance_exists(grid)) {
	x -= x mod grid.grid_size;
	y -= y mod grid.grid_size;
}
