if(sound_gunshot_play and !mute) {
	sound_gunshot_play = false;
	audio_play_sound(sfx_snare,0,0,volume * volume_sound,0,4/global.global_tick_interval);
}

if(playsound_missile_explode and !mute) {
	playsound_missile_explode = false;
	audio_play_sound(sfx_missile_explode,0,0,volume * volume_sound,0,4/global.global_tick_interval);
}

if(playsound_missile_explode2 and !mute) {
	playsound_missile_explode2 = false;
	audio_play_sound(sfx_missile_explode2,0,0,volume * volume_sound,0,4/global.global_tick_interval);
}

if(playsound_missile_launch and !mute) {
	playsound_missile_launch = false;
	audio_play_sound(sfx_missile_launch,0,0,volume * volume_sound,0,4/global.global_tick_interval);
}

if(playsound_missile_launch2 and !mute) {
	playsound_missile_launch2 = false;
	audio_play_sound(sfx_missile_launch2,0,0,volume * volume_sound,0,4/global.global_tick_interval);
}

if(playsound_contruction and !mute) {
	playsound_contruction = false;
	audio_play_sound(sfx_construction,0,0,volume * volume_sound,0,4/global.global_tick_interval);
}

if(playsound_soldier_die and !mute) {
	playsound_soldier_die = false;
	audio_play_sound(sfx_wilhelm,0,0,volume * volume_sound,0,4/global.global_tick_interval);
}

if(playsound_explosion0 and !mute) {
	playsound_explosion0 = false;
	audio_play_sound(sfx_explosion0,0,0,volume * volume_sound,0,4/global.global_tick_interval);
}

if(playsound_explosion1 and !mute) {
	playsound_explosion1 = false;
	audio_play_sound(sfx_explosion1,0,0,volume * volume_sound,0,4/global.global_tick_interval);
}

if(playsound_button_hover and !mute) {
	playsound_button_hover = false;
	audio_play_sound(sfx_button_hover,0,0,volume * volume_sound,0,4/global.global_tick_interval);
}

if(playsound_button_pressed and !mute) {
	playsound_button_pressed = false;
	audio_play_sound(sfx_button_pressed,0,0,volume * volume_sound,0,4/global.global_tick_interval);
}

if(playsound_gun0 and !mute) {
	playsound_gun0 = false;
	audio_play_sound(sfx_gun0,0,0,volume * volume_sound,0,4/global.global_tick_interval);
}

if(playsound_flak and !mute) {
	playsound_flak = false;
	audio_play_sound(sfx_flak,0,0,volume * volume_sound,0,4/global.global_tick_interval);
}

if(playsound_ship_weapon0 and !mute) {
	playsound_ship_weapon0 = false;
	audio_play_sound(sfx_ship_weapon0,0,0,volume * volume_sound,0,4/global.global_tick_interval);
}

//music
if(music == noone and !mute) {
	music = audio_play_sound(music_doctor_dreamchip,0,true,volume * volume_music)
}