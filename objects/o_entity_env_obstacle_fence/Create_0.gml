// Inherit the parent event
event_inherited();

hp = 20;
hp_max = hp;

image_speed = 0;

tileset = spr_tileset_fence
sprite_index = tileset

image_index = autotile_get_tile(object_index,4)

nearby_tile = ds_list_create();

event_user(0)