//mouse_position
var mx = mouse_x;
var my = mouse_y;

//draw button
for(var i = 0; i < sprite_get_number(spr_button_icon); i++) {
	var button_x1 = button_origin_x + button_origin_x * i + button_spacing_x * i;
	var button_x2 = button_x1 + button_size;
	var button_y2 = button_origin_y + button_size;
	
	//set default draw color
	var col = c_gray;
	
	//check if mouse hover on button
	if(mx >= button_x1 and mx < button_x2 and my >= button_origin_y and my < button_y2) {
		col = c_white;
		if(mouse_check_button_pressed(mb_left)) button_selected = i;
	} else {
		if (button_selected == i) col = c_yellow;
	}
	
	draw_sprite_ext(spr_button_frame,0,button_x1,button_origin_y,1,1,0,col,1);
	draw_sprite(spr_button_icon,i,button_x1+1,button_origin_y+1);
}