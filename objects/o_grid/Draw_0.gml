if(global.global_tick_timer > 0 and debuging) {
	path_clear_points(path);
	if (mp_grid_path(global.path_grid, path, path_start_x, path_start_y, mouse_x, mouse_y, true))
    {
		draw_path(path,0,0,true);
	}
}

//draw random boxes
if(keyboard_check_pressed(vk_space)) {
	Y_start = random(1000);
	X = random(1000);	
}

