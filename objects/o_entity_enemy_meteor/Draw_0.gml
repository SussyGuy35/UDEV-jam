draw_self();

for(var i = ds_list_size(previous_pos_x); i > 0; i--) {
	var dx = ds_list_find_value(previous_pos_x,i-1);
	var dy = ds_list_find_value(previous_pos_y,i-1)
	draw_sprite_ext(spr_meteor,0,dx,dy,1,1,image_angle,color_set[10 - i],1)	;
}