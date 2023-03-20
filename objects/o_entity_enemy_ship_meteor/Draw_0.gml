draw_self();
if(hatch_opening > -1 and hp > 0) draw_sprite(sprite_index,8 + hatch_opening,x,y)

//reset draw color and alpha
draw_set_alpha(1);
draw_set_color(c_white);

scr_death_animation_bigexplosion_draw();