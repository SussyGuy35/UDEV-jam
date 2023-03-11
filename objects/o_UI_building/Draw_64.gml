//mouse_position
var mx = mouse_x;
var my = mouse_y;

mouse_hovering = false;
button_hovering = -1;
//draw button
for(var i = 0; i < sprite_get_number(spr_button_icon); i++) {
	var button_x1 = button_origin_x + button_origin_x * i + button_spacing_x * i;
	var button_x2 = button_x1 + button_size;
	var button_y2 = button_origin_y + button_size;
	
	//set default draw color
	var col = c_gray;
	
	//check if mouse hover on button
	if(mx >= button_x1 and mx < button_x2 and my >= button_origin_y and my < button_y2) {
		mouse_hovering = true;
		button_hovering = i;
		col = c_white;
		
		if(mouse_check_button_pressed(mb_left)) {
			button_selected = i;
			playsound_button_pressed = true;
			
			//create contruction side with select contruction side
			if(i == 10) {
				scr_UI_building_switch_toBuild(o_entity_player_building_tent);
			} else if (i == 11) {
				scr_UI_building_switch_toBuild(o_entity_player_building_turret_flak);
			} else if (i == 12) {
				scr_UI_building_switch_toBuild(o_entity_player_building_conyard);
			} else if (i == 15) {
				scr_UI_building_switch_toBuild(o_entity_enemy_building_gate);	
			}
		}
	} else {
		if (button_selected == i) col = c_yellow;
	}
	
	draw_sprite_ext(spr_button_frame,0,button_x1,button_origin_y,1,1,0,col,1);
	draw_sprite(spr_button_icon,i,button_x1+1,button_origin_y+1);
}

//play button hovering sound if needed
if(mouse_hovering != mouse_hovering_prev and mouse_hovering) {
	playsound_button_hover = true;
}
mouse_hovering_prev = mouse_hovering;

/* 
//for testing fonts
var text_size = 15
var text = "éèẻẽẹêếềểễệúùủũụưứừửữựíìỉĩịóòỏõọôốồổỗộơớờởỡợ"
var text2 = "áàảãạâầẩẫậăằẳẵặđyýỳỷỹỵ"
var text3 = "ÉÈẺẼẸẾỀỂỄỆÚÙỦŨỤƯỨỪỬỮỰÍÌỈĨỊÓÒỎÕỌÔỐỒỔỖỘ"
var text4 = "ƠỚỜỞỠỢÁÀẢÃẠÂẤẦẨẪẬĂẮẰẲẴẶĐYÝỲỶỸỴ"
draw_set_font(Font1);
draw_text_ext(0,0,text,1,text_size)
draw_text_ext(0,20,text2,1,text_size)
draw_text_ext(0,40,text3,1,text_size)
draw_text_ext(0,60,text4,1,text_size);

draw_set_alpha(1);
draw_set_color(0);
var init_y = 80;
for(var i = 0; i < sprite_get_number(font0); i++) {
	var _y = floor(i/20) * sprite_get_height(font0)
	draw_sprite(font0, i, (sprite_get_width(font0)+1) * i - floor(i/20) * (sprite_get_width(font0)+1) * 20,init_y +_y)
}
*/