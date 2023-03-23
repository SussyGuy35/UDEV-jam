// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_achievement_message(str){
	ds_list_add(ach_message_str, str);
	ds_list_add(ach_message_timer,ach_message_interval);
	if(ds_list_size(ach_message_str) > ach_message_limit) {
		ds_list_delete(ach_message_str, 0);
		ds_list_delete(ach_message_timer, 0);
	}
}