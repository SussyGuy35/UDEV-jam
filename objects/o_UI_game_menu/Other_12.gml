global.global_tick_timer = 0;
global.global_tick_interval = 4;
if(audio_get_name(music) != "music_doctor_dreamchip") {
	music = audio_play_sound(music_doctor_dreamchip,0,true,volume * volume_music);
}
room_goto(0);