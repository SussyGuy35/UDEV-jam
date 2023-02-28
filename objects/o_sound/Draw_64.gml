draw_sprite(spr_button_mute,mute,mute_button_x,mute_button_y);

//mouse_position
var mx = mouse_x;
var my = mouse_y;

if(mx >= mute_button_x and mx <= mute_button_x + 8 
	and my >= mute_button_y and my <= mute_button_y+ 8) {
	if(mouse_check_button_pressed(mb_left)) {
		if(mute) mute = false; else mute = true;
	}
}