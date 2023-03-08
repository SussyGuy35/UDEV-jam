if(mouse_check_button_pressed(mb_right) and mouse_y < room_height - grid_size * 4) {
	switch (button_selected) {
		case 0:
			scr_place_env_creativemode_sign(o_entity_env_sign_direction,INSTRUCTION_DIRECTION.UPWARD);
		
			break;
		case 1:
			scr_place_env_creativemode_sign(o_entity_env_sign_direction,INSTRUCTION_DIRECTION.DOWNWARD);
		
			break;
		case 2:
			scr_place_env_creativemode_sign(o_entity_env_sign_direction,INSTRUCTION_DIRECTION.LEFTWARD);
		
			break;
		case 3:
			scr_place_env_creativemode_sign(o_entity_env_sign_direction,INSTRUCTION_DIRECTION.RIGHTWARD);
		
			break;
		case 4:
		
		
			break;
		case 5:
			scr_place_env_creativemode(o_entity_env_ladder);
		
			break;
		case 6:
			scr_place_env_creativemode(o_entity_env_block);
		
			break;
		case 7:
			scr_place_env_creativemode(o_entity_env_obstacle_fence);
			
			break;
		case 8:
			scr_place_env_creativemode_decon();
			
			break;
		case 9:
			instance_create_layer(mouse_x,mouse_y,"Instances",o_entity_player_soldier);
			
			break;
		case 10:
			
			break;
		case 11:
			
			break;
		case 12:
			
			break;
		case 13:
			instance_create_layer(mouse_x,mouse_y,"Instances",o_entity_enemy_spider_smart);
			break;
		case 14:
			instance_create_layer(mouse_x,mouse_y,"Instances",o_entity_enemy_launcher);
			break;
		case 15:
			
			break;
		case 16:
			instance_create_layer(mouse_x,mouse_y,"Instances",o_entity_enemy_beacon_meteor);
			break
		case 17:
			instance_create_layer(mouse_x,mouse_y,"Instances",o_entity_enemy_meteor);
			break;
		case 18:
			instance_create_layer(mouse_x,mouse_y,"Instances",o_entity_env_prop_tree_pine);
			break;
		case 19:
			instance_create_layer(mouse_x,mouse_y,"Instances",o_entity_env_prop_vine);
			break;
		default:
			
			break;
	}
}

if(button_selected != 10 and button_selected != 11 and button_selected != 12 and button_selected != 15) {
	if(instance_exists(building_side)) instance_destroy(building_side);
	building_side = noone;
}