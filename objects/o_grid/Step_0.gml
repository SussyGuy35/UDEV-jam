if(mouse_check_button_pressed(mb_middle) and debuging) {
	path_start_x = mouse_x;
	path_start_y = mouse_y;
}

if(global.global_tick_timer > 0) {
	global.starting_gate_counter--;
	path_request_timeout--;
	if(path_request_timeout <= 0) {
		path_request_timeout = path_request_interval * global.global_tick_timer;
		ds_list_clear(global.path_request_obj_id);
		ds_list_clear(global.path_request_obj_id);
	}
	
	/*
	//update grid forbiden cells (not optimize)
	mp_grid_clear_all(global.path_grid);
	
	var solid_n = instance_number(o_entity_env_solid);
	for (i = 0; i < solid_n; i++) {
		var cell = instance_find(o_entity_env_solid,i);
		mp_grid_add_rectangle(global.path_grid,cell.bbox_left + 1,cell.bbox_top + 1,cell.bbox_right,cell.bbox_bottom);
	}
	
	var obstacle_n = instance_number(o_entity_env_obstacle);
	for (i = 0; i < obstacle_n; i++) {
		var cell = instance_find(o_entity_env_obstacle,i);
		mp_grid_add_rectangle(global.path_grid,cell.bbox_left + 1,cell.bbox_top + 1,cell.bbox_right,cell.bbox_bottom);
	}
	*/
}


//clean up path request
for (var i = 0; i < ds_list_size(global.path_request_obj_id); i++) {
	if(!instance_exists(ds_list_find_value(global.path_request_obj_id,i))) {
		ds_list_delete(global.path_request_obj_id,i);
		ds_list_delete(global.path_request_granted,i);
	}
}

//grid repair
if(mouse_check_button(mb_right)) {
	var block = collision_point(mouse_x,mouse_y,o_entity_env,true,true);
	if(!instance_exists(block)) {
		var xx = mouse_x - mouse_x mod grid_size;
		var yy = mouse_y - mouse_y mod grid_size;
		ds_grid_add(dsgrid,xx / grid_size,yy / grid_size,
			instance_create_layer(xx,yy,"Structures",o_entity_env_void));
	}
}