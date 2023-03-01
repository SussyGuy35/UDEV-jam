if(hp < 0 and !supporting_building) {
	if(!collision_point(x,y,o_entity_env,false,true)) {
		var grid = instance_nearest(x,y,o_grid);
		var w = x / grid_size;
		var h = y / grid_size;
		grid.grid[w][h] = instance_create_layer(w*grid_size,h*grid_size,"Structures",o_entity_env_void);
	}
	instance_destroy();
}