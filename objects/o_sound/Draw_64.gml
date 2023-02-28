image_index = mute;

//mouse_position
var mx = mouse_x;
var my = mouse_y;

if(mx >= x and mx <= x + 8 
	and my >= y and my <= y + 8) {
	if(mouse_check_button_pressed(mb_left)) {
		playsound_button_pressed = true;
		if(mute) mute = false; else mute = true;
	}
}