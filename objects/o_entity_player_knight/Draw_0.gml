draw_self();
	
//draw muzzle flashing
if(muzzle_flashing) {
	draw_sprite_ext(spr_knight_slash,fire_dir,x,y,dir,1,0,c_white,1);
}

//draw jetpack
if(instruction_direction == INSTRUCTION_DIRECTION.JETPACK and !recalling and hp > 0) {
	if(state == ENTITY_STATE.ATTACKING) {
		draw_sprite_ext(spr_soldier_jetpack,fire_dir,x,y,dir,1,0,c_white,1);
		/*jetpack_spark_timer--;
		if(jetpack_spark_timer <= 0) {
			instance_create_layer(x-2*dir,y-2,"Bullets",o_gfx_spark_drop);
			jetpack_spark_timer = jetpack_flying_interval;
		}*/
	} else {
		draw_sprite_ext(spr_soldier_jetpack,2,x,y,dir,1,0,c_white,1);
		/*jetpack_spark_timer--;
		if(jetpack_spark_timer <= 0) {
			instance_create_layer(x-2*dir,y-2,"Bullets",o_gfx_spark_drop);
			jetpack_spark_timer = jetpack_flying_interval;
		}*/
	}
	
	if(jetpack_spark_timer mod 2 == 0) {
		draw_sprite_ext(spr_soldier_jetpack_jet,0,x,y,dir,1,0,c_white,1);
		jetpack_spark_timer = jetpack_flying_interval;
	}
}

//debug show attack range
if(debuging != 0) {
	draw_set_color(c_white);
	draw_circle(x,y,range,true);

}