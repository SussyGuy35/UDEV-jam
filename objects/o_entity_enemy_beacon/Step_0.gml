//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
	
	image_index++;
	if(image_index >= image_number) image_index = 0;
	
	flak_deflecting_color_brightness /= 2;
	if(flak_deflecting_color_brightness < 0.05) flak_deflecting_color_brightness = 0;
	
	if(hp <= 0) {
		instance_create_layer(x,y,"Bullets",o_gfx_explosion);
		playsound_missile_explode = true;
		instance_destroy();
	}
}