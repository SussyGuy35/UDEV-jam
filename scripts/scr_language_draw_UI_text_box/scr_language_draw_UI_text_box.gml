// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_language_draw_UI_text_box(str){
	draw_set_font(global.Font);
	var string_h = string_height(str);
	var string_w = string_width(str) //(char_w - 1) * string_length(str);
	
	var text_offset = 4;
	
	var box_w = string_w + text_offset * 2;
	var box_h = string_h + text_offset * 2;
	
	var align_left = true;
	var align_top = true;
	
	if(mouse_x < room_width - box_w) align_left = false;
	if(mouse_y < room_height - box_h) align_top = false;
	
	var x1 = 0;
	var x2 = 0;
	var y1 = 0;
	var y2 = 0;
	
	if(align_left) {
		x2 = mouse_x;
		x1 = mouse_x - box_w;
	} else {
		x1 = mouse_x;
		x2 = mouse_x + box_w;
	}
	
	if(align_top) {
		y2 = mouse_y;
		y1 = mouse_y - box_h;
	} else {
		y1 = mouse_y;
		y2 = mouse_y + box_h;
	}
	
	var text_origin_x = x1 + text_offset;
	var text_origin_y = y1 + text_offset;
	
	//draw box background
	draw_set_color(global.textbox_color_background);
	draw_set_alpha(0.5);
	
	draw_roundrect(x1,y1,x2,y2,false);
	
	draw_set_color(global.textbox_color_border);
	draw_set_alpha(1);
	draw_roundrect(x1 + 1, y1 + 1, x2 - 1, y2 - 1, true);
	
	draw_text(text_origin_x,text_origin_y,str);
}