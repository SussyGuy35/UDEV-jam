//achievement timing
scr_achievement_timing();

///////////////////////
// ACHIEVEMENT CHECK //
///////////////////////

if(ach_build_barrack == 0) {
	if(instance_exists(instance_nearest(x,y,o_entity_player_building_tent))) {
		ach_build_barrack = 1;	
		
		str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_BARRACK");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}

if(ach_build_conyard == 0) {
	if(instance_exists(instance_nearest(x,y,o_entity_player_building_conyard))) {
		ach_build_conyard = 1;	
		
		str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_CONYARD");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}

if(ach_build_fence == 0) {
	if(instance_exists(instance_nearest(x,y,o_entity_env_obstacle_fence))) {
		ach_build_fence = 1;	
		
		str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_FENCE");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}

if(ach_build_flak == 0) {
	if(instance_exists(instance_nearest(x,y,o_entity_player_building_turret_flak))) {
		ach_build_flak = 1;	
		
		str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_FLAK");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}


if(ach_build_fort == 0) {
	if(instance_exists(instance_nearest(x,y,o_entity_player_building_fort))) {
		ach_build_fort = 1;	
		
		str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_FORT");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}


if(ach_build_icon_clicked == 0) {
	var obj_ = instance_nearest(x,y,o_UI_building); 
	if(instance_exists(obj_)) {
		if(obj_.button_selected >= 0) {	
			ach_build_icon_clicked = 1;	
			
			str = ds_map_find_value(global.language_map, "STR_ACH_ICON_CLICKED");
			scr_achievement_message(str_completed + str);
			playsound_bassDing = true;
		
		}
	}
}

if(ach_build_ladder == 0) {
	if(instance_number(o_entity_env_ladder) > 0) {
		ach_build_ladder = 1;	
			
		str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_LADDER");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}

if(ach_build_sign_jetpack == 0) {
	var sign_n = instance_number(o_entity_env_sign_direction);
	
	for(var i = 0; i < sign_n; i ++) {
		var sign_id = instance_find(o_entity_env_sign_direction,i);
		if(instance_exists(sign_id)) {
			if (sign_id.instruction_direction == INSTRUCTION_DIRECTION.JETPACK) {
				ach_build_sign_jetpack = 1;	
			
				str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_SIGN_JETPACK");
				scr_achievement_message(str_completed + str);
				playsound_bassDing = true;	
				
			}
		}
	}
}

if(ach_build_sign_leftright == 0) {
	var sign_n = instance_number(o_entity_env_sign_direction);
	
	for(var i = 0; i < sign_n; i ++) {
		var sign_id = instance_find(o_entity_env_sign_direction,i);
		if(instance_exists(sign_id)) {
			if (sign_id.instruction_direction == INSTRUCTION_DIRECTION.LEFTWARD
				or sign_id.instruction_direction == INSTRUCTION_DIRECTION.RIGHTWARD) 
			{
				ach_build_sign_leftright = 1;	
			
				str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_SIGN_LEFTRIGHT");
				scr_achievement_message(str_completed + str);
				playsound_bassDing = true;
					
			}
		}
	}
}

if(ach_build_sign_updown == 0) {
	var sign_n = instance_number(o_entity_env_sign_direction);
	
	for(var i = 0; i < sign_n; i ++) {
		var sign_id = instance_find(o_entity_env_sign_direction,i);
		if(instance_exists(sign_id)) {
			if (sign_id.instruction_direction == INSTRUCTION_DIRECTION.UPWARD
				or sign_id.instruction_direction == INSTRUCTION_DIRECTION.DOWNWARD) 
			{
				ach_build_sign_updown = 1;	
			
				str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_SIGN_UPDOWN");
				scr_achievement_message(str_completed + str);
				playsound_bassDing = true;
					
			}
		}
	}
}

if(ach_build_wall == 0) {
	if(instance_number(o_entity_env_block) > 0) {
		ach_build_wall = 1;	
			
		str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_WALL");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}

if(ach_conyard_underground == 0) {
	var consite_n = instance_number(o_entity_env_construction_side_building);
	
	for(var i = 0; i < consite_n; i ++) {
		var consite = instance_find(o_entity_env_construction_side_building,i);
		if(instance_exists(consite)) {
			if(consite.side_placed and consite.side_to_build == o_entity_player_building_conyard) {
				var collided = collision_rectangle(consite.bbox_top + 2, 
									consite.bbox_left + 2,
									consite.bbox_bottom - 2,
									consite.bbox_right - 2,
									o_entity_env_impassable,false,
									true);
				if(instance_exists(collided))
				{
					ach_conyard_underground = 1;	
			
					str = ds_map_find_value(global.language_map, "STR_ACH_CONYARD_UNDERGROUND");
					scr_achievement_message(str_completed + str);
					playsound_bassDing = true;
					
				}
			}
		}
	}
}

if(ach_fast_forward == 0) {
	if(global.global_tick_interval < 4 and global.global_tick_interval > 0) {
		ach_fast_forward = 1;	
			
		str = ds_map_find_value(global.language_map, "STR_ACH_FAST_FORWARD");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}

if(ach_first_block_construction == 0) {
	var consite_n = instance_number(o_entity_env_contruction_side);
	
	for(var i = 0; i < consite_n; i ++) {
		var consite = instance_find(o_entity_env_contruction_side,i);
		if(instance_exists(consite)) {
			if(instance_exists(consite.contructor)) {
				ach_first_block_construction = 1;	
			
				str = ds_map_find_value(global.language_map, "STR_ACH_FIRST_BLOCK_CONSTRUCTION");
				scr_achievement_message(str_completed + str);
				playsound_bassDing = true;
				
			}
		}
	}
}

if(ach_first_block_deconstruction == 0) {
	var consite_n = instance_number(o_entity_env_decontruction_side);
	
	for(var i = 0; i < consite_n; i ++) {
		var consite = instance_find(o_entity_env_decontruction_side,i);
		if(instance_exists(consite)) {
			if(instance_exists(consite.contructor)) {
				ach_first_block_deconstruction = 1;	
			
				str = ds_map_find_value(global.language_map, "STR_ACH_FIRST_BLOCK_DECONSTRUCTION");
				scr_achievement_message(str_completed + str);
				playsound_bassDing = true;
				
			}
		}
	}
}

if(ach_kill_shield_with_flak == 0) {
	if(global.shield_killed_by_flak > 0) {
		ach_kill_shield_with_flak = 1;	
			
		str = ds_map_find_value(global.language_map, "STR_ACH_KILL_SHIELD_WITH_FLAK");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}

if(ach_kill_soldier_with_jetpack == 0) {
	if(global.jetpack_kill > 0) {
		ach_kill_soldier_with_jetpack = 1;
		
		str = ds_map_find_value(global.language_map, "STR_ACH_KILL_SOLDIER_WITH_JETPACK");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}

if(ach_kill_swordman_vs_spider == 0) {
	if(global.melee_spider_kill > 0) {
		ach_kill_swordman_vs_spider = 1;	
			
		str = ds_map_find_value(global.language_map, "STR_ACH_KILL_SWORDMAN_VS_SPIDER");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}

if(ach_kill_with_flak == 0) {
	if(global.killed_by_flak > 0) {
		ach_kill_with_flak = 1;	
			
		str = ds_map_find_value(global.language_map, "STR_ACH_KILL_WITH_FLAK");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}

if(ach_mute == 0) {
	if(mute) {
		ach_mute = 1;	
		
		str = ds_map_find_value(global.language_map, "STR_ACH_MUTE");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}

if(ach_pause_resume == 0) {
	if(global.global_tick_interval < 0) {
		ach_pause_resume = 1;	
			
		str = ds_map_find_value(global.language_map, "STR_ACH_PAUSE_RESUME");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}

if(ach_recall_success == 0) {
	if(global.soldier_recalled > 0) {
		ach_recall_success = 1;
					
		str = ds_map_find_value(global.language_map, "STR_ACH_RECALL_SUCCESS");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}

if(ach_shoot_throught_fence == 0) {
	var player_n = instance_number(o_entity_player);
	
	for(var i = 0; i < player_n; i ++) {
		var player = instance_find(o_entity_player,i);
		
		if(instance_exists(player)) {
			if(player.state == ENTITY_STATE.ATTACKING and instance_exists(player.target_enemy)) {
				if(instance_exists(collision_line(
					player.x,
					player.y,
					player.target_enemy.x,
					player.target_enemy.y,
					o_entity_env_obstacle_fence,
					false,
					true))) 
				{
					ach_shoot_throught_fence = 1;
					
					str = ds_map_find_value(global.language_map, "STR_ACH_SHOOT_THROUGHT_FENCE");
					scr_achievement_message(str_completed + str);
					playsound_bassDing = true;
					
				}
			}
		}
	}
}

if(ach_slow_down == 0) {
	if(global.global_tick_interval > 4) {
		ach_slow_down = 1;	
			
		str = ds_map_find_value(global.language_map, "STR_ACH_SLOW_DOWN");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}

if(ach_spawn_rifleman == 0) {
	if(global.rifleman_created > 10) {
		ach_spawn_rifleman = 1;	
			
		str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_RIFLEMAN");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}

if(ach_spawn_swordman == 0) {
	if(global.swordman_created > 10) {
		ach_spawn_swordman = 1;	
			
		str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_SWORDMAN");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}

if(ach_use_sign_jetpack == 0) {
	if(global.jetpack_activated) {
		ach_use_sign_jetpack = 1;	
			
		str = ds_map_find_value(global.language_map, "STR_ACH_USE_SIGN_JETPACK");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}

if(ach_use_sign_leftright == 1) {
	ach_use_sign_leftright = 2;	
			
	str = ds_map_find_value(global.language_map, "STR_ACH_USE_SIGN_LEFTRIGHT");
	scr_achievement_message(str_completed + str);
	playsound_bassDing = true;
	
}

if(ach_use_sign_updownladder == 0) {
	if(global.ladder_used > 0) {
		ach_use_sign_updownladder = 1;	
			
		str = ds_map_find_value(global.language_map, "STR_ACH_USE_SIGN_UPDOWNLADDER");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}

if(ach_rebuild == 0) {
	if(global.rebuild > 50) {
		ach_rebuild = 1;	
			
		str = ds_map_find_value(global.language_map, "STR_ACH_REBUILD");
		scr_achievement_message(str_completed + str);
		playsound_bassDing = true;
		
	}
}

if(chal_no_soldier_instant_spawned == 0) {
	if(global.soldier_instant_spawned > 3) {
		chal_no_soldier_instant_spawned = -1;
		
		playsound_chal_lost = true;
	} else {
		if(room == 1 and loading == false and instance_number(o_entity_enemy) == 0) {
			chal_no_soldier_instant_spawned = 1;
		}
	}
}

if(chal_no_truck_killed == 0) {
	if(global.truck_lost > 0) {
		chal_no_truck_killed = -1;
		
		playsound_chal_lost = true;
	} else {
		if(room == 1 and loading == false and instance_number(o_entity_enemy) == 0) {
			chal_no_truck_killed = 1;
		}
	}
}

if(chal_start_3gates_1stmin_then_clear == 0) {
	if(global.starting_gate_counter == 0 and instance_number(o_entity_enemy_building_gate) < 3) {
		chal_start_3gates_1stmin_then_clear = -1;
		
		playsound_chal_lost = true;
	} else if (global.starting_gate_counter == 0 and instance_number(o_entity_enemy_building_gate) >= 3) {
		audio_stop_sound(music);
		playsound_echoDing = true;
		music = audio_play_sound(music_bloodpixelhero_atmospheric_loop_15,0,true,volume * volume_music);
	} else {
		if(room == 1 and loading == false and instance_number(o_entity_enemy) == 0) {
			chal_start_3gates_1stmin_then_clear = 1;
		}
	}
}

if(instance_number(o_entity_enemy) == 0 
	and room == 1 
	and !loading 
	and !instance_exists(instance_nearest(x,y,o_victory_message))) 
	{
		if(chal_start_3gates_1stmin_then_clear == 1
			and chal_no_truck_killed == 1
			and chal_no_soldier_instant_spawned == 1
			and ach_total == ach_reached)
		{
			if(!completed) {
				instance_create_layer(x,y,"Instances",o_UI_completed);
				completed = true;
				victory = true;
			}
		} else {
			if(!victory) {
				instance_create_layer(x,y,"Instances",o_UI_victory);
				victory = true;
			}
		}
	}
