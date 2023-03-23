// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_achievement_timing(){
	var size = ds_list_size(ach_message_str);
	if(size >= 1) {
		for(var i = 0; i < size; i++) {
			var timer = ds_list_find_value(ach_message_timer,i);
			if(timer > 0) {
				ds_list_set(ach_message_timer,i,timer - 1);
			}
		}
	
		while(ds_list_find_value(ach_message_timer,0) <= 0) {
			ds_list_delete(ach_message_str,0);	
			ds_list_delete(ach_message_timer,0);	
		}
	}
}