/*
	Tên: o_game
	Chức năng: Đây là object dùng để quản lý các hệ thống trong game.
		Nó sẽ bao gồm các variable (biến). 
		Một số sẽ là global variable (biến chung) để tiện cho việc truy cập.
*/

/*đây là global variable quản lý cho tốc độ game.
	khi global_tick_timer = 0, các vật thể trong game sẽ tự cập nhật
	sau đó global_tick_timer = global_tick_interval
	mỗi frame thì global_tick_timer sẽ -1
	trong trường hợp global_tick_interval < 0, game sẽ tạm dừng
*/
global.global_tick_interval = 4;
global.global_tick_timer = 0;

//load configurations
ini_open("configuration.ini");
globalvar debuging;
debuging = ini_read_real("gameplay","debugging",1);

globalvar view_width;
globalvar view_height;
view_width = ini_read_real("graphics","view_w",512);
view_height = ini_read_real("graphics","view_h",288);
globalvar window_scale;
window_scale = ini_read_real("graphics","window_scale",2);
globalvar fullscreen;
fullscreen = ini_read_real("graphics","fullscreen",0);
window_set_fullscreen(fullscreen);

globalvar mute;
mute = ini_read_real("sounds","mute",0);
globalvar volume;
volume = ini_read_real("sounds","volume",1);
globalvar volume_sound;
volume_sound = ini_read_real("sounds","sound",1);
globalvar volume_music;
volume_music = ini_read_real("sounds","music",1);

//population control
globalvar soldier_pop;
soldier_pop = ini_read_real("gameplay","soldier_pop",50);
globalvar soldier_count;
soldier_count = 0;
globalvar enemy_pop;
enemy_pop = ini_read_real("gameplay","enemy_pop",100);
globalvar recall_allow;
recall_allow = false;
//grid
grid_obj = instance_nearest(x,y,o_grid);

globalvar loading;
loading = false;

global.show_overlap = false;
//set up language
scr_language_char();
scr_language_load_default();
global.Font = font_add_sprite_ext(spr_font1, char, true, 0);
global.Font_big = font_add_sprite_ext(spr_font2, char, true, 0);
global.textbox_color_border = c_white;
global.textbox_color_background = c_black;
global.textbox_color_text_default = c_white;
global.textbox_color_text_title = c_orange;
global.textbox_color_text_des = c_white;