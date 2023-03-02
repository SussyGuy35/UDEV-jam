//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
	
	//update last pos
	ds_list_add(previous_pos_x,x);
	ds_list_add(previous_pos_y,y);
	if(ds_list_size(previous_pos_x) > previous_position_max) {
		ds_list_delete(previous_pos_x,0);
		ds_list_delete(previous_pos_y,0);	
	}
	if(collision_circle(x,y,4,o_entity_env_solid,false,true)
		or collision_circle(x,y,4,o_entity_env_obstacle,false,true))
	{
		instance_destroy();		
	}
	
	//move
	x += lengthdir_x(movespeed,image_angle);
	y += lengthdir_y(movespeed,image_angle);
	
	if(hp <= 0) instance_destroy();
}