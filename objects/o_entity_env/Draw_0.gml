draw_self();
/*
if(sprite_index != -1) { //if object have sprite
	var damage_spot_count = 0;
	for(var i = hp; i < hp_max; i += hp_max / max_damage_spots) {
		damage_spot_count++;
	}
	
	damage_spot_count -= ds_list_size(damage_spot_x);
	
	for(var i = 0; i < damage_spot_count; i++) {
		var rx = irandom_range(bbox_left,bbox_right - 1);
		var ry = irandom_range(bbox_top,bbox_bottom - 1);
		
		ds_list_add(damage_spot_x,rx);
		ds_list_add(damage_spot_y,ry);
	}
	
	for(var i = 0; i < ds_list_size(damage_spot_x); i++) {
		var sx = ds_list_find_value(damage_spot_x,i);
		var sy = ds_list_find_value(damage_spot_y,i);
		
		draw_sprite_ext(spr_bullet_hit,0,sx,sy,1,1,0,c_black,0.5);
	}
}
*/