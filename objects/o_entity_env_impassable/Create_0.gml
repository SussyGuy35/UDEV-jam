// Inherit the parent event
event_inherited();

hp = 100;
image_speed = 0;

//autotile variables
tileset = spr_tileset_test
sprite_index = tileset
/*
autotile_w_other_solid = false;
autotile_w_other_obstacle = false;
*/
object_to_autotile_w = noone
autotile_update = true;

nearby_tile = ds_list_create()

//create path finind forbiden area
mp_grid_add_rectangle(global.path_grid,bbox_left + 1,bbox_top + 1,bbox_right,bbox_bottom);
event_user(0)

