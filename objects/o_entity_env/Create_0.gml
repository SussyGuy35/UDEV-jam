/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

hp = 100;
hp_max = hp;

max_damage_spots = 4;
damage_spot_x = ds_list_create();
damage_spot_y = ds_list_create();

must_grounded = false;

state_structure = STRUCT_STATE.FINISHED;

supporting_building = false;

grid_x = -1;
grid_y = -1;

instruction_direction = INSTRUCTION_DIRECTION.NONE;
rebuildable = false;

image_speed = 0;