/// set tile
ds_list_destroy(nearby_tile)
nearby_tile = ds_list_create()
collision_rectangle_list(x-4,y-4,x+8,y+8,object_index,false,true,nearby_tile,false)
var size = ds_list_size(nearby_tile)
show_debug_message(size)

for (var i = 0; i < size; i++){
	var tile = ds_list_find_value(nearby_tile,i)
	with tile {alarm[0] = 1}
}