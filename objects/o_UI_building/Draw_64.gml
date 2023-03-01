//mouse_position
var mx = mouse_x;
var my = mouse_y;

mouse_hovering = false;

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
		col = c_white;
		if(mouse_check_button_pressed(mb_left)) {
			button_selected = i;
			playsound_button_pressed = true;
			
			//create contruction side with select contruction side
			if(i == 10) {
				if(!building_side) {
					building_side = instance_create_layer(mouse_x,mouse_y,"Bullets",o_entity_env_construction_side_building);
					building_side.side_to_build = o_entity_player_building_tent;
					building_side.side_update = true;
				} else {
					if(instance_exists(building_side)) {
						if(building_side.side_to_build != o_entity_player_building_tent) {
							building_side.side_to_build = o_entity_player_building_tent;
							building_side.side_update = true;
						}
					}
				}
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