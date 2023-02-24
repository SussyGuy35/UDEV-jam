draw_self();
	
//draw muzzle flashing
if(muzzle_flashing) {
	draw_sprite_ext(spr_soldier_muzzle_flash,fire_dir,x,y,dir,1,0,c_white,1);	
}

//debug show attack range
if(debuging != 0) {
	draw_circle(x,y,range,true);

}