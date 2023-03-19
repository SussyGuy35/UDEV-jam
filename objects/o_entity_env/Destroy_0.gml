for(var i = 0; i < max_damage_spots; i++) {
	var rx = irandom_range(bbox_left,bbox_right - 1);
	var ry = irandom_range(bbox_top,bbox_bottom - 1);
	
	instance_create_layer(rx,ry,"Bullets",o_gfx_spark_drop);
}