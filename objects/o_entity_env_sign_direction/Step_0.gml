//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
	
	var col = c_red;
	if(switch_on) col = c_green;
	
	if(instruction_direction = INSTRUCTION_DIRECTION.UPWARD) {
		image_blend = col;
		
		_image_index++;
		if(_image_index >= image_max_index) _image_index = 0;
		image_index = image_max_index * 0 + _image_index;
		
	} else if(instruction_direction = INSTRUCTION_DIRECTION.DOWNWARD) {
		image_blend = col;
		
		_image_index++;
		if(_image_index >= image_max_index) _image_index = 0;
		image_index = image_max_index * 1 + _image_index;
		
	} else if(instruction_direction = INSTRUCTION_DIRECTION.LEFTWARD) {
		image_blend = col;
		
		_image_index++;
		if(_image_index >= image_max_index) _image_index = 0;
		image_index = image_max_index * 2 + _image_index;
		
	} else if(instruction_direction = INSTRUCTION_DIRECTION.RIGHTWARD) {
		image_blend = col;
		
		_image_index++;
		if(_image_index >= image_max_index) _image_index = 0;
		image_index = image_max_index * 3 + _image_index;
		
	} else {
		col = c_yellow;
		image_blend = col;
		
		_image_index++;
		if(_image_index >= image_max_index) _image_index = 0;
		image_index = image_max_index * 0 + _image_index;
		
	}
	draw_self();
}