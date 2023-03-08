/// @description Insert description here
// You can write your code in this editor






// Inherit the parent event
event_inherited();

//tree variables
grow_chance = 0.5;
grow_interval = 300;
grow_timer = grow_interval;
grow_clearance_left		= bbox_left;
grow_clearance_right	= bbox_right;
grow_clearance_top		= bbox_bottom - 1;
grow_clearance_bottom	= bbox_bottom -1 + sprite_height;

//vine variables
vine_top = collision_point(x,y - 1,o_entity_env_soil,false,true);
vine_bottom = noone;

image_index = irandom_range(0,image_number-1);

