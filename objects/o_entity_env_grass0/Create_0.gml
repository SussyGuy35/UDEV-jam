// Inherit the parent event
event_inherited();

hp = 50;
hp_max = hp;
image_speed = 0;

tileset = spr_tileset_grass0
sprite_index = tileset
autotile_w_other_solid = true;
autotile_w_other_obstacle = false;

nearby_tile = ds_list_create()

event_user(0)