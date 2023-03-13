draw_set_alpha(1);
draw_ellipse_color(x - mf_w * mf_scale, 
					y - mf_h * mf_scale, 
					x + mf_w * mf_scale, 
					y + mf_h * mf_scale,
					mf_color1, 
					mf_color2,
					false);

//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
	tick_timer = tick_interval;
	mf_scale -= mf_scale_decay;
	if(mf_scale <= 0) instance_destroy();
}