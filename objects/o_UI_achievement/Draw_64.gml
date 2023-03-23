draw_set_font(global.Font);
draw_set_color(c_green);

var size = ds_list_size(ach_message_str);
if(size > 0) {
	var text_y = 0;
	for(var i = 0; i < size; i++) {
		draw_set_alpha(ds_list_find_value(ach_message_timer,i) / ach_message_interval);
		draw_text(0,text_y,ds_list_find_value(ach_message_str,i));
		text_y += string_height(ds_list_find_value(ach_message_str,i));
	}	
}

draw_set_alpha(1);
if(ach_reached < ach_total) {
	draw_set_color(c_orange);
} else draw_set_color(c_green);
draw_text(bbox_right + 4, y, str_achieved + string(ach_reached) + "|" + string(ach_total));

draw_set_color(c_white);
draw_set_alpha(1);

//challenges
if(chal_start_3gates_1stmin_then_clear == -1) {
	draw_sprite(spr_UI_challenge_3gates,chal_lost_indicate_timer[0] mod 2, x - 14, y);
	if(chal_lost_indicate_timer[0] > 1) chal_lost_indicate_timer[0]--;
} else if (chal_start_3gates_1stmin_then_clear == 0) {
	draw_sprite(spr_UI_challenge_3gates,0, x - 14, y);
} else draw_sprite(spr_UI_challenge_3gates,2, x - 14, y);

if(chal_no_soldier_instant_spawned == -1) {
	draw_sprite(spr_UI_challenge_no_soldier_spam,chal_lost_indicate_timer[1] mod 2, x - 28, y);
	if(chal_lost_indicate_timer[1] > 1) chal_lost_indicate_timer[1]--;
} else if (chal_no_soldier_instant_spawned == 0) {
	draw_sprite(spr_UI_challenge_no_soldier_spam,0, x - 28, y);
} else draw_sprite(spr_UI_challenge_no_soldier_spam,2, x - 28, y);

if(chal_no_truck_killed == -1) {
	draw_sprite(spr_UI_challenge_truck_saved,chal_lost_indicate_timer[2] mod 2, x - 42, y);
	if(chal_lost_indicate_timer[2] > 1) chal_lost_indicate_timer[2]--;
} else if (chal_no_truck_killed == 0) {
	draw_sprite(spr_UI_challenge_truck_saved,0, x - 42, y);
} else draw_sprite(spr_UI_challenge_truck_saved,2, x - 42, y);

var mx1 = x-14;
var mx2 = x-2;
var my1 = y;
var my2 = y+12
if(mouse_x >= mx1 and mouse_x <= mx2 and mouse_y >= my1 and mouse_y <= my2) {
	var str_ = ds_map_find_value(global.language_map, "STR_CHAL_START_3GATES_1STMIN_THEN_CLEAR")
	scr_language_draw_UI_text_box(str_challenge + str_);
}

var mx1 = x-28;
var mx2 = x-16;
var my1 = y;
var my2 = y+12;
if(mouse_x >= mx1 and mouse_x <= mx2 and mouse_y >= my1 and mouse_y <= my2) {
	var str_ = ds_map_find_value(global.language_map, "STR_CHAL_NO_SOLDIER_INSTANT_SPAWNED")
	scr_language_draw_UI_text_box(str_challenge + str_);
}

var mx1 = x-42;
var mx2 = x-30;
var my1 = y;
var my2 = y+12;
if(mouse_x >= mx1 and mouse_x <= mx2 and mouse_y >= my1 and mouse_y <= my2) {
	var str_ = ds_map_find_value(global.language_map, "STR_CHAL_NO_TRUCK_KILLED")
	scr_language_draw_UI_text_box(str_challenge + str_);
}

if(description) scr_language_draw_UI_text_box(str_achievements);

//achievement board
if(ach_display) {
	var x1 = room_width/2 - ach_display_w/2 - ach_box_offset_w;
	var x2 = room_width/2 +ach_display_w/2 + ach_box_offset_w;
	draw_set_color(c_white);
	draw_rectangle(x1, 4, x2, ach_display_h + 20,true);
	
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(x1, 4, x2, ach_display_h + 20,false);
	
	draw_set_font(global.Font_big);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_halign(fa_middle);
	draw_text(room_width/2,4,str_achievements);
	draw_line(x1,18,x2,18);
	
	draw_set_font(global.Font);
	draw_set_halign(fa_left);
	
	var surface = surface_create(ach_display_w,ach_display_h);
	surface_set_target(surface);
	
	list_h = ach_scroll_y;
	list_w = 0;
	ach_reached = 0;
	ach_total = 0;
	var str_w = 0;
	
	str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_BARRACK");
	if(ach_build_barrack == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	
	str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_CONYARD");
	if(ach_build_conyard == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_FENCE");
	if(ach_build_fence == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_FLAK");
	if(ach_build_flak == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}

	str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_FORT");
	if(ach_build_fort == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}

	str = ds_map_find_value(global.language_map, "STR_ACH_ICON_CLICKED");
	if(ach_build_icon_clicked == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_LADDER");
	if(ach_build_ladder == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_SIGN_JETPACK");
	if(ach_build_sign_jetpack == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_SIGN_LEFTRIGHT");
	if(ach_build_sign_leftright == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_SIGN_UPDOWN");
	if(ach_build_sign_updown == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_WALL");
	if(ach_build_wall == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_CONYARD_UNDERGROUND");
	if(ach_conyard_underground == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_FAST_FORWARD");
	if(ach_fast_forward == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_FIRST_BLOCK_CONSTRUCTION");
	if(ach_first_block_construction == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_FIRST_BLOCK_DECONSTRUCTION");
	if(ach_first_block_deconstruction == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_KILL_SHIELD_WITH_FLAK");
	if(ach_kill_shield_with_flak == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_KILL_SOLDIER_WITH_JETPACK");
	if(ach_kill_soldier_with_jetpack == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_KILL_SWORDMAN_VS_SPIDER");
	if(ach_kill_swordman_vs_spider == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_KILL_WITH_FLAK");
	if(ach_kill_with_flak == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_MUTE");
	if(ach_mute == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_PAUSE_RESUME");
	if(ach_pause_resume == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_RECALL_SUCCESS");
	if(ach_recall_success == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_SHOOT_THROUGHT_FENCE");
	if(ach_shoot_throught_fence == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_SLOW_DOWN");
	if(ach_slow_down == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_RIFLEMAN");
	if(ach_spawn_rifleman == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_BUILD_SWORDMAN");
	if(ach_spawn_swordman == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_USE_SIGN_JETPACK");
	if(ach_use_sign_jetpack == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_USE_SIGN_LEFTRIGHT");
	if(ach_use_sign_leftright == 2) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_USE_SIGN_UPDOWNLADDER");
	if(ach_use_sign_updownladder == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	str = ds_map_find_value(global.language_map, "STR_ACH_REBUILD");
	if(ach_rebuild == 1) {
		scr_achievement_complete_str(str_w);
	} else {
		scr_achievement_on_progress_str(str_w);
	}
	
	surface_reset_target();
	draw_surface(surface,room_width/2 - ach_display_w/2, 20);
}

if(mouse_wheel_down()) {
	
	//if(ach_scroll_y < 0) ach_scroll_y = 0;
	if(ach_scroll_y + list_h > ach_display_h + ach_scroll_y ) ach_scroll_y -= ach_scroll_speed;;
}

if(mouse_wheel_up()) {
	if(ach_scroll_y < 0) ach_scroll_y += ach_scroll_speed;
	
}
