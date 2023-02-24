 //-1 global_tick_timer mỗi frame (khung hình)
global.global_tick_timer--;


//phần debug: nơi chứa các code tạm để test game. hãy xóa hoặc vô hiệu hóa chúng nếu không cần nữa

/*
//nhấp chuột trái tạo lính
if(mouse_check_button_pressed(mb_left)) {
	if(keyboard_check(vk_lshift)) {
		instance_create_layer(mouse_x,mouse_y,"Instances",o_entity_enemy_spider);	
	} else 
	instance_create_layer(mouse_x,mouse_y,"Instances",o_entity_player_soldier);	
}

//nhấp chuột phải tạo khối bê tông
if(mouse_check_button(mb_right)) {
	if(keyboard_check(vk_lshift)) {
		var col_grid = collision_point(mouse_x,mouse_y,o_entity_env_void,false,true);
		if (col_grid) {
			with(instance_create_layer(col_grid.x,col_grid.y,"Instances",o_entity_env_contruction_side)) {
			contructing = o_entity_env_block;
			}
			instance_destroy(col_grid);
		}
	} else {
		if(instance_exists(grid_obj)) {
			var col_grid = collision_point(mouse_x,mouse_y,o_entity_env_void,false,true);
			if(col_grid) {
				instance_create_layer(col_grid.x,col_grid.y,"Instances",o_entity_env_block);
				instance_destroy(col_grid);
			}
		}
	}
}
