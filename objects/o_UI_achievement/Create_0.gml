//achivement condition reached: -1: locked; 0: unlocked+incompleted; 1: Completed
ach_mute = 0;
ach_fast_forward = 0;
ach_slow_down = 0;
ach_pause_resume = 0;
ach_turn_debug = 0;
ach_build_icon_clicked = 0;
ach_recall_success = 0;
ach_first_block_construction = 0;
ach_first_block_deconstruction = 0;
ach_build_sign_updown = 0;
ach_build_sign_leftright = 0;
ach_build_sign_jetpack = 0;
ach_build_ladder = 0;
ach_build_barrack = 0;
ach_build_fort = 0;
ach_build_flak = 0;
ach_build_conyard = 0;
ach_build_wall = 0;
ach_build_fence = 0;
ach_spawn_rifleman = 0;
ach_spawn_swordman = 0;
ach_use_sign_leftright = 0;
ach_use_sign_updownladder = 0;
ach_use_sign_jetpack = 0;
ach_kill_soldier_with_jetpack = 0;
ach_kill_swordman_vs_spider = 0;
ach_conyard_underground = 0;
ach_rebuild = 0;
ach_shoot_throught_fence = 0;
ach_kill_with_flak = 0;
ach_kill_shield_with_flak = 0;

//challenge
chal_start_3gates_1stmin_then_clear = 0;
chal_no_truck_killed = 0;
chal_no_soldier_instant_spawned = 0;

chal_lost_indicate_interval = 600;
chal_lost_indicate_timer = array_create(3, chal_lost_indicate_interval);

//achivement completion messages
ach_message_str = ds_list_create();
ach_message_timer = ds_list_create();
ach_message_interval = 450;
ach_message_limit = 10;

str_completed = ds_map_find_value(global.language_map, "STR_ACH_COMPLETED");
str_on_progress = ds_map_find_value(global.language_map, "STR_ACH_ON_PROGRESS");
str_achievements  = ds_map_find_value(global.language_map, "STR_ACHIEVEMENTS");
str_achieved = ds_map_find_value(global.language_map, "STR_ACHIEVED");
str_challenge = ds_map_find_value(global.language_map, "STR_CHALLENGE");

ach_total = 30;
ach_reached = 0;

description = false;

ach_display = false;
ach_display_w = room_height;
ach_display_h = room_height - 60;
list_h_spacing = 4
ach_scroll_y = 0;
ach_scroll_speed = 8;
ach_box_offset_w = 4;

victory = false;
completed = false;

//records
global.jetpack_kill = 0;
global.melee_spider_kill = 0;
global.building_created = 0;
global.building_lost = 0;
global.soldier_created = 0;
global.soldier_lost = 0;
global.truck_supplied = 0;
global.truck_lost = 0;
global.robot_created = 0;
global.robot_lost = 0;
global.rifleman_created = 0;
global.rifleman_lost = 0;
global.swordman_created = 0;
global.swordman_lost = 0;
global.flak_cannon_created = 0;
global.flak_cannon_lost = 0;
global.conyard_created = 0;
global.conyard_lost = 0;
global.spider_created = 0;
global.spider_lost = 0;
global.missile_bot_created = 0;
global.missile_bot_lost = 0;
global.destroyer_created = 0;
global.destroyer_lost = 0;
global.gate_created = 0;
global.gate_lost = 0;
global.shield_created = 0;
global.shield_lost = 0;
global.shield_killed_by_flak = 0
global.fort_created = 0;
global.fort_lost = 0;
global.barrack_created = 0;
global.barrack_lost = 0;
global.starting_gate = 0;
global.starting_gate_interval = 15*60;
global.starting_gate_counter = global.starting_gate_interval;
global.instructed_leftright = 0;
global.ladder_used = 0;
global.jetpack_activated = 0;
global.soldier_recalled = 0;
global.soldier_instant_spawned = 0;
global.rebuild = 0;
global.killed_by_flak = 0;