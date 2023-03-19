//mouse_position
var mx = mouse_x;
var my = mouse_y;

if(mx >= x and mx <= x + 8 
	and my >= y and my <= y + 8) 
	{
		scr_language_draw_UI_text_box(ds_map_find_value(global.language_map,"STR_RECALL"));
}
