// Inherit the parent event
event_inherited();

hp = 100;
hp_max = hp;
image_speed = 0;

tileset = spr_tileset_stone1
sprite_index = tileset

image_index = autotile_get_tile(object_index,4)

//autotile_w_other_solid = false;
//autotile_w_other_obstacle = false;

nearby_tile = ds_list_create()

event_user(0)