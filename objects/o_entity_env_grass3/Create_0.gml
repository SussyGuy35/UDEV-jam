// Inherit the parent event
event_inherited();

hp = 50;
hp_max = hp;
image_speed = 0;

tileset = spr_tileset_grass2
sprite_index = tileset
//autotile_w_other_solid = false;
//autotile_w_other_obstacle = false;
object_to_autotile_w = o_entity_env_solid

nearby_tile = ds_list_create()

event_user(0)