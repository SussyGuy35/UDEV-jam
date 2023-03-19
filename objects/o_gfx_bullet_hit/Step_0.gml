//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer == 0) {
	image_index++;
	if(image_index = image_number - 1) instance_destroy();
	
	tick_timer = tick_interval;
}