global.soldier_instant_spawned = 0;
global.starting_gate = 0;


if(instance_exists(ach)) {
	if(ach.chal_start_3gates_1stmin_then_clear != 1) {
		global.starting_gate_counter = global.starting_gate_interval;
		ach.chal_start_3gates_1stmin_then_clear = 0;
	}
	if(ach.chal_no_soldier_instant_spawned != 1) {
		global.soldier_instant_spawned = 0;
		chal_no_soldier_instant_spawned = 0;
	}
	
	if(ach.chal_no_truck_killed != 1) {
		global.truck_lost = 0;
		ach.chal_no_truck_killed = 0;
	}
	
	if(ach.chal_start_3gates_1stmin_then_clear != 1
		or ach.chal_no_soldier_instant_spawned != 1
		or ach.chal_no_truck_killed != 1)
	{
		ach.chal_start_3gates_1stmin_then_clear = 0;
		chal_no_soldier_instant_spawned = 0;
		ach.chal_no_truck_killed = 0;
	}
	
	ach.chal_lost_indicate_timer[0] = ach.chal_lost_indicate_interval;
	ach.chal_lost_indicate_timer[1] = ach.chal_lost_indicate_interval;
	ach.chal_lost_indicate_timer[2] = ach.chal_lost_indicate_interval;
}


if(audio_get_name(music) != "music_doctor_dreamchip") {
	audio_stop_sound(music);
	music = audio_play_sound(music_doctor_dreamchip,0,true,volume * volume_music);
}
room_goto(1);