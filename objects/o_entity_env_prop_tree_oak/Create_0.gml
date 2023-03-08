/// @description Insert description here
// You can write your code in this editor






// Inherit the parent event
event_inherited();

//tree variables
grow_stage = 0;
grow_stage_max = 4;
grow_chance = 0.2;
grow_interval = 300;
grow_timer = grow_interval;
grow_clearance_left		= bbox_left + sprite_width;
grow_clearance_right	= bbox_right + sprite_width;
grow_clearance_top		= bbox_top;
grow_clearance_bottom	= bbox_bottom -1;


//damage expression
damaged_expression_tresshold = 80;

