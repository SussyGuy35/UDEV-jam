//mouse_position
var mx = mouse_x;
var my = mouse_y;

if(mx >= x and mx <= x + 8 
	and my >= y and my <= y + 8) 
	{
		if(mouse_check_button_pressed(mb_right)) {
			var soldier_number = instance_number(o_entity_player_soldier);
			for(var i = 0; i < soldier_number; i++) {
				with (instance_find(o_entity_player_soldier,i)) {
					recalling = true;
				}
			}
		}
}
