/*
	Tên: o_camera
	Chức năng:
		object này sẽ chịu trách nhiệm điều khiển camera tức góc nhìn của người chơi.
*/

//độ phân giải gốc
view_width = 320;
view_height = 240;

//vị trí camera
view_x = -1;
view_y = -1;

//window_scale là định dạng kích thước khung hình theo cấp số nhân;
globalvar window_scale;
window_scale = 4;

//đặt kích thước cửa sổ
window_set_size(view_width * window_scale,view_height * window_scale);


surface_resize(application_surface,view_width * window_scale,view_height * window_scale);