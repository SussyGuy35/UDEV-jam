// Inherit the parent event
event_inherited();

hp = 100;
hp_max = hp;
image_speed = 0;

tileset = spr_tileset_bedrock
sprite_index = tileset

image_index = autotile_get_tile(object_index,4)

nearby_tile = ds_list_create()

event_user(0)