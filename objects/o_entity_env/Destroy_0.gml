for(var i = 0; i < ds_list_size(damage_spot_x); i++) {
	var sx = ds_list_find_value(damage_spot_x,i);
	var sy = ds_list_find_value(damage_spot_y,i);
		
	instance_create_layer(sx,sy,"Bullets",o_gfx_spark_drop);
}