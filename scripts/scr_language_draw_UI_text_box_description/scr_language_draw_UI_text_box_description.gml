// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_language_draw_UI_text_box_description(str_title, str_des){
	draw_set_font(global.Font);
	var string_h = string_height(str_title) + string_height(str_des);
	var string_w = string_width(str_des) //(char_w - 1) * string_length(str);
	
	var text_offset = 4;
	
	var box_w = string_w + text_offset * 2;
	var box_h = string_h + text_offset * 2;
	
	var x1 = x;
	var x2 = x + box_w;
	var y1 = y - box_h;
	var y2 = y;
	
	//draw box background
	draw_set_color(global.textbox_color_background);
	draw_set_alpha(0.5);
	
	draw_roundrect(x1,y1,x2,y2,false);
	
	draw_set_color(global.textbox_color_border);
	draw_set_alpha(1);
	draw_roundrect(x1 + 1, y1 + 1, x2 - 1, y2 - 1, true);
	
	draw_set_color(global.textbox_color_text_title);
	var text_origin_x = x1 + text_offset;
	var text_origin_y = y1 + text_offset;
	draw_text(text_origin_x,text_origin_y,str_title);
	
	draw_set_color(global.textbox_color_text_des);
	text_origin_y += string_height(str_title);
	draw_text(text_origin_x,text_origin_y,str_des);
}