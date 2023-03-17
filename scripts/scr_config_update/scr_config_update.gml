// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_config_update(section,key,value){
	ini_open("configurations.ini");
	ini_write_real(section, key, value);
	ini_close();
}