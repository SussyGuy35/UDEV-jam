// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_achievement_complete_str(str_w){
	draw_set_color(c_green);
	draw_text(0,list_h,str_completed + str);
	str_w = string_width(str_completed + str);
	if(str_w > list_w) list_w = str_w;
	list_h += string_height(str_completed + str) + list_h_spacing;
	ach_reached++;
	ach_total++;
	
	draw_set_color(c_gray);
	draw_line(0,list_h-2,ach_display_w,list_h-2);
}