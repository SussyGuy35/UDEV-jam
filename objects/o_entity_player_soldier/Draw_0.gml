draw_self();
	
//draw muzzle flashing
if(muzzle_flashing) {
	draw_sprite_ext(spr_soldier_muzzle_flash,fire_dir,x,y,dir,1,0,c_white,1);	
}

//debug show attack range
if(debuging != 0) {
	draw_circle(x,y,range,true);
	
	
	if(ladder_below) {
		draw_line(ladder_below.x - 10,ladder_below.y,ladder_below.x + 10,ladder_below.y);
		draw_line(ladder_below.x,ladder_below.y - 10,ladder_below.x,ladder_below.y + 10);
	}
	
	draw_set_color(c_yellow);
	if(on_ladder) {
		draw_line(on_ladder.x - 10,on_ladder.y,on_ladder.x + 10,on_ladder.y);
		draw_line(on_ladder.x,on_ladder.y - 10,on_ladder.x,on_ladder.y + 10);
	}
}