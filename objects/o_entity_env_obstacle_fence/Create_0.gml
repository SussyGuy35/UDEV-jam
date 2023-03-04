// Inherit the parent event
event_inherited();

hp = 20;
hp_max = hp;

image_speed = 0;

tileset = spr_tileset_fence
sprite_index = tileset

nearby_tile = ds_list_create();
autotile_w_other_solid = true;
autotile_w_other_obstacle = true;

event_user(0)