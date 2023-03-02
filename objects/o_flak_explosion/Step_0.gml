//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {

	if(image_index == image_number - 1) {
		image_alpha -= alpha_decay_speed;
	} else image_index++;
	if(image_alpha <= 0) instance_destroy();
	
	tick_timer = tick_interval;
}