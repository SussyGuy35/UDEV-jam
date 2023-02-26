if(global.global_tick_timer > 0 and debuging) {
	path_clear_points(path);
	if (mp_grid_path(global.path_grid, path, path_start_x, path_start_y, mouse_x, mouse_y, true))
    {
		draw_path(path,0,0,true);
	}
}