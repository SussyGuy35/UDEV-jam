// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_language_load_default(){
	//open JSON file
	var directory = working_directory + "languages\\";
	show_debug_message("directory: " + directory);
	var json_file = file_text_open_read(directory + "lang_eng.txt");
	var data = "";
	
	//read JSON file
	while (!file_text_eof(json_file)) {
		data += file_text_read_string(json_file);
		file_text_readln(json_file);
	}
	
	//close JSON file
	file_text_close(json_file);
	
	//init language map
	global.language_map = json_decode(data);
	
}