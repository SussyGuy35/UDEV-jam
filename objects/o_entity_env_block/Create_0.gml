// Inherit the parent event
event_inherited();

hp = 100;
image_speed = 0;

tileset = spr_tileset_test
sprite_index = tileset

image_index = autotile_get_tile(object_index,4)

nearby_tile = ds_list_create()

event_user(0)