//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
	
	decay--;
	if(hp <= 0 or decay <= 0) instance_destroy();
	
	if(instance_exists(target)) {
		var dir = point_direction(x,y,target.x,target.y);
		
		//dir = dir - dir mod 45;
		
		turning_timer--;
		if(turning_timer <= 0) {
			if(angle_difference(dir,image_angle) < 22.5) {
				image_angle -= 45;
			} else if (angle_difference(dir, image_angle) > 22.5) {
				image_angle += 45;	
			}
			
			turning_timer = turning_interval;
		}
		
		var collide = collision_point(x,y,o_entity_env_solid,false,true);
		if(collide) {
			instance_destroy();
		}
		
		var collide = collision_point(x,y,o_entity_env_obstacle,false,true);
		if(collide) {
			instance_destroy();
		}
		
		collide = collision_point(x,y,o_entity_player,false,true);
		
		if(collide) {
			instance_destroy();
		}
	} else {
		instance_destroy();
	}
	
	trail_timer--;
	if(trail_timer == 0) {
		trail_timer = trail_interval;
		
		instance_create_layer(x,y,"Bullets",o_gfx_bullet_hit);
	}
	
	trail_timer--;
	if(trail_timer <= 0) {
		ds_list_add(trail_x,x);
		ds_list_add(trail_y,y);
		trail_timer = trail_interval;
	}
	
	var size = ds_list_size(trail_x);
	if(size > trail_number) {
		ds_list_delete(trail_x,0);
		ds_list_delete(trail_y,0);
	}
	
	x += lengthdir_x(movespeed,image_angle);
	y += lengthdir_y(movespeed,image_angle);
	
	//bullet hit area
	hit_area_left	= bbox_left;
	hit_area_right	= bbox_right;
	hit_area_top	= bbox_top;
	hit_area_bottom = bbox_bottom;
}

