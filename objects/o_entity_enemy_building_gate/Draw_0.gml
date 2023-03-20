draw_self();

scr_death_animation_bigexplosion_draw();

if(object_exists(spawn_next)) {
	draw_sprite_ext(object_get_sprite(spawn_next),0,x,y,1,1,0,c_red,0.5);
}