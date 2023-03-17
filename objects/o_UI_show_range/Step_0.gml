if(mouse_check_button_pressed(mb_left)) {
	if(mouse_x >= bbox_left and mouse_y < bbox_right and mouse_y >= bbox_top and mouse_y < bbox_bottom) {
		if(debuging) {
			debuging = false;
			scr_config_update("gameplay","debugging",0);
			image_index = 1;
		} else {
			debuging = true;
			scr_config_update("gameplay","debugging",1);
			image_index = 0;
		}
	}
}
