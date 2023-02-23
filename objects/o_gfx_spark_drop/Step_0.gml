//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
	decay--;
	
	if (decay <= 0) instance_destroy();
	tick_timer = tick_interval;
	
	y += vsp; 
}