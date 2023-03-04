if(mouse_check_button_pressed(mb_left)) {
	if(mouse_x >= bbox_left and mouse_y < bbox_right and mouse_y >= bbox_top and mouse_y < bbox_bottom) {
		if(debuging) {
			debuging = false; 
			image_index = 1;
		} else {
			debuging = true;
			image_index = 0;
		}
	}
}
