/// set tile
ds_list_destroy(nearby_tile)
nearby_tile = ds_list_create()
/*
if(autotile_w_other_obstacle and autotile_w_other_solid) {
	collision_rectangle_list(x-4,y-4,x+8,y+8,o_entity_env_impassable,false,true,nearby_tile,false)
} else if (autotile_w_other_obstacle and !autotile_w_other_solid) {
	collision_rectangle_list(x-4,y-4,x+8,y+8,o_entity_env_obstacle,false,true,nearby_tile,false)
} else if (!autotile_w_other_obstacle and autotile_w_other_solid) {
	collision_rectangle_list(x-4,y-4,x+8,y+8,o_entity_env_solid,false,true,nearby_tile,false)
} else collision_rectangle_list(x-4,y-4,x+8,y+8,object_index,false,true,nearby_tile,false)
var size = ds_list_size(nearby_tile)
*/
if (!object_to_autotile_w){
	collision_rectangle_list(x-4,y-4,x+8,y+8,object_index,false,true,nearby_tile,false)
}
else {
	collision_rectangle_list(x-4,y-4,x+8,y+8,object_index,false,true,nearby_tile,false)
	collision_rectangle_list(x-4,y-4,x+8,y+8,object_to_autotile_w,false,true,nearby_tile,false)
}

var size = ds_list_size(nearby_tile)

for (var i = 0; i < size; i++){
	var tile = ds_list_find_value(nearby_tile,i)
	with tile {alarm[0] = 1}
}