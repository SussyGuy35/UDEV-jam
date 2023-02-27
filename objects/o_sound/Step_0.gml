if(sound_gunshot_play and !mute) {
	sound_gunshot_play = false;
	audio_play_sound(sfx_snare,0,0);
}

if(playsound_missile_explode and !mute) {
	playsound_missile_explode = false;
	audio_play_sound(sfx_missile_explode,0,0);
}

if(playsound_missile_launch and !mute) {
	playsound_missile_launch = false;
	audio_play_sound(sfx_missile_launch,0,0);
}

if(playsound_contruction and !mute) {
	playsound_contruction = false;
	audio_play_sound(sfx_construction,0,0);
}

if(playsound_soldier_die and !mute) {
	playsound_soldier_die = false;
	audio_play_sound(sfx_wilhelm,0,0);
}