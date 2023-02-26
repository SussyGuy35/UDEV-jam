if(global.global_tick_timer > 0) {
	path_clear_points(path);
	if (mp_grid_path(global.path_grid, path, path_start_x, path_start_y, mouse_x, mouse_y, true))
    {
		if(path_following) {
			draw_path(path,0,0,true);
		}
	}
}

/*
for(var w = 0; w < grid_w; w++) {
	for(var h = 0; h < grid_h; h++) {
		draw_sprite(spr_bullet_hit,0,w * 4 + path_offset_x + 1, h* 4 + path_offset_y + 1);
	}
}