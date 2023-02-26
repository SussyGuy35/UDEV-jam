if(global.global_tick_timer > 0) {
	//granting one path request
	var i = 0;
	var request_number = ds_list_size(global.path_request_obj_id);
	
	if(request_number > 0) {
		while(!instance_exists(ds_list_find_value(global.path_request_obj_id,i)) and i != 0) {
			i++;
		}
	}
	
	while (i < request_number) {
		if(!ds_list_find_value(global.path_request_granted,i)) {
			ds_list_set(global.path_request_granted,i,true);
			i = request_number;
		} else i++;
	}

}