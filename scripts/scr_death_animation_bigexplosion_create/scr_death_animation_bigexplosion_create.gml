// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_death_animation_bigexplosion_create(){
	//death
	particle_per_frame = 16;
	particle_x = ds_list_create();
	particle_y = ds_list_create();
	particle_speed = 2;
	particle_range = sprite_width + sprite_height;
	light_orb_area = 0;
	orb_radius = 0;
	orb_radius_max = 12;
	ellipse_w1 = orb_radius_max;
	ellipse_w2 = sprite_width * 2;
	ellipse_h1 = orb_radius_max;
	ellipse_h2 = orb_radius_max / 2;
	vline_speed = 0;
	vline_speed_max = 10;
	flash_interval = 60;
	flash_timer = flash_interval;
	explosion_played = false;
}