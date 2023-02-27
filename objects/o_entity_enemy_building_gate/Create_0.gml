/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

hp = 1000;

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

//death
particle_per_frame = 16;
particle_x = ds_list_create();
particle_y = ds_list_create();
particle_speed = 2;
light_orb_area = 0;
orb_radius = 0;
orb_radius_max = 12;