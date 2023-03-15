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

globalvar debuging;
debuging = 1;

grid_obj = instance_nearest(x,y,o_grid);

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