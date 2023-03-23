// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_achievement_on_progress_str(str_w){
	draw_set_color(c_orange);
	draw_text(0,list_h,str_on_progress + str);
	str_w = string_width(str_on_progress + str);
	if(str_w > list_w) list_w = str_w;
	list_h += string_height(str_on_progress + str) + list_h_spacing;
	ach_total++;
	
	draw_set_color(c_gray);
	draw_line(0,list_h-2,ach_display_w,list_h-2);
}