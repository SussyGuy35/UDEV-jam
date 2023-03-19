draw_set_font(global.Font);

draw_set_color(c_teal);
draw_text(x,y,ds_map_find_value(global.language_map,"STR_SOLDIER_POP") 
								+ string(soldier_count) 
								+ "|" 
								+ string(soldier_pop));

var enemies = instance_number(o_entity_enemy) 
			- instance_number(o_entity_enemy_missile) 
			- instance_number(o_entity_enemy_meteor);
			
draw_set_color(c_red);
draw_text(x,y + 8,ds_map_find_value(global.language_map,"STR_ENEMY_POP") 
								+ string(enemies) 
								+ "|" 
								+ string(enemy_pop));

draw_set_color(c_white);
draw_set_halign(fa_left);