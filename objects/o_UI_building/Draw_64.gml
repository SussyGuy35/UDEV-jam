if(mouse_hovering and !loading) {
	switch (button_hovering) {
		case 0:
		scr_language_draw_UI_text_box_description(
			ds_map_find_value(global.language_map,"STR_GO_UP"),
			ds_map_find_value(global.language_map,"STR_GO_UP_DESC"));
			//scr_place_env_creativemode_sign(o_entity_env_sign_direction,INSTRUCTION_DIRECTION.UPWARD);
		
			break;
		case 1:
			
		scr_language_draw_UI_text_box_description(
			ds_map_find_value(global.language_map,"STR_GO_DOWN"),
			ds_map_find_value(global.language_map,"STR_GO_DOWN_DESC"));
			//scr_place_env_creativemode_sign(o_entity_env_sign_direction,INSTRUCTION_DIRECTION.DOWNWARD);
		
			break;
		case 2:
		
		scr_language_draw_UI_text_box_description(
			ds_map_find_value(global.language_map,"STR_GO_LEFT"),
			ds_map_find_value(global.language_map,"STR_GO_LEFT_DESC"));
			//scr_place_env_creativemode_sign(o_entity_env_sign_direction,INSTRUCTION_DIRECTION.LEFTWARD);
		
			break;
		case 3:
		
		scr_language_draw_UI_text_box_description(
			ds_map_find_value(global.language_map,"STR_GO_RIGHT"),
			ds_map_find_value(global.language_map,"STR_GO_RIGHT_DESC"));
			//scr_place_env_creativemode_sign(o_entity_env_sign_direction,INSTRUCTION_DIRECTION.RIGHTWARD);
		
			break;
		case 4:
		
		
			break;
		case 5:
			
		scr_language_draw_UI_text_box_description(
			ds_map_find_value(global.language_map,"STR_LADDER"),
			ds_map_find_value(global.language_map,"STR_LADDER_DESC"));
			//scr_place_env_creativemode(o_entity_env_ladder);
		
			break;
		case 6:
			scr_language_draw_UI_text_box_description(
				ds_map_find_value(global.language_map,"STR_WALL"),
				ds_map_find_value(global.language_map,"STR_WALL_DESC"));
			//scr_place_env_creativemode(o_entity_env_block);
		
			break;
		case 7:
			scr_language_draw_UI_text_box_description(
				ds_map_find_value(global.language_map,"STR_FENCE"),
				ds_map_find_value(global.language_map,"STR_FENCE_DESC"));
			//scr_place_env_creativemode(o_entity_env_obstacle_fence);
			
			break;
		case 8:
			scr_language_draw_UI_text_box_description(
				ds_map_find_value(global.language_map,"STR_DECON"),
				ds_map_find_value(global.language_map,"STR_DECON_DESC"));
			//scr_place_env_creativemode_decon();
			
			break;
		case 9:
			scr_language_draw_UI_text_box_description(
				ds_map_find_value(global.language_map,"STR_SOLDIER"),
				ds_map_find_value(global.language_map,"STR_SOLDIER_DESC"));
		
			//instance_create_layer(mouse_x,mouse_y,"Instances",o_entity_player_soldier);
			
			break;
		case 10:
			scr_language_draw_UI_text_box_description(
				ds_map_find_value(global.language_map,"STR_BARRACK"),
				ds_map_find_value(global.language_map,"STR_BARRACK_DESC"));
			
			break;
		case 11:
			scr_language_draw_UI_text_box_description(
				ds_map_find_value(global.language_map,"STR_FLAK_TURRET"),
				ds_map_find_value(global.language_map,"STR_FLAK_TURRET_DESC"));
			
			break;
		case 12:
			scr_language_draw_UI_text_box_description(
				ds_map_find_value(global.language_map,"STR_CONYARD"),
				ds_map_find_value(global.language_map,"STR_CONYARD_DESC"));
			
			break;
		case 13:
			scr_language_draw_UI_text_box_description(
				ds_map_find_value(global.language_map,"STR_SPIDER_BOT"),
				ds_map_find_value(global.language_map,"STR_SPIDER_BOT_DESC"));
			//instance_create_layer(mouse_x,mouse_y,"Instances",o_entity_enemy_spider_smart);
			break;
		case 14:
		
			scr_language_draw_UI_text_box_description(
				ds_map_find_value(global.language_map,"STR_MISSILE_BOT"),
				ds_map_find_value(global.language_map,"STR_MISSILE_BOT_DESC"));
			//instance_create_layer(mouse_x,mouse_y,"Instances",o_entity_enemy_launcher);
			break;
		case 15:
			scr_language_draw_UI_text_box_description(
				ds_map_find_value(global.language_map,"STR_GATE"),
				ds_map_find_value(global.language_map,"STR_GATE_DESC"));
			
			break;
		case 16:		
			scr_language_draw_UI_text_box_description(
				ds_map_find_value(global.language_map,"STR_BEACON"),
				ds_map_find_value(global.language_map,"STR_BEACON_DESC"));
			//instance_create_layer(mouse_x,mouse_y,"Instances",o_entity_enemy_beacon_meteor);
			break
		case 17:			
			scr_language_draw_UI_text_box_description(
				ds_map_find_value(global.language_map,"STR_METEOR"),
				ds_map_find_value(global.language_map,"STR_METEOR_DESC"));
			//instance_create_layer(mouse_x,mouse_y,"Instances",o_entity_enemy_meteor);
			break;
		case 18:
			scr_language_draw_UI_text_box_description(
				ds_map_find_value(global.language_map,"STR_DESTROYER"),
				ds_map_find_value(global.language_map,"STR_DESTROYER_DESC"));
			break;
		case 19:
			
			break;
		default:
			
			break;
	}
}