grid_size = 4;
grid_w = room_width / grid_size;
grid_h = room_height / grid_size;
grid = array_create(grid_w,array_create(grid_h));

for(var w = 0; w < grid_w; w++) {
	for(var h = 0; h < grid_h; h++) {
		grid[w][h] = instance_create_layer(w*grid_size,h*grid_size,"Structures",o_entity_env_void);
	}
}