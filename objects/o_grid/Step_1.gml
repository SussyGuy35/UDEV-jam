if(global.global_tick_timer > 0) {
	var i = 0;
	
	if(ds_list_size(global.path_request_obj_id) > 0) {
		while(!instance_exists(ds_list_find_value(global.path_request_obj_id,i)) and i != 0) {
			i++;
		}
	}
	
	while (i < ds_list_size(global.path_request_obj_id)) {
		if(!ds_list_find_value(global.path_request_granted,i)) {
			ds_list_set(global.path_request_granted,i,true);
		} else i++;
	}

}