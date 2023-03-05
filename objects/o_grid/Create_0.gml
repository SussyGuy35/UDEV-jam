//structure grid
globalvar grid_size;
grid_size = 4;
grid_w = room_width / grid_size;
grid_h = room_height / grid_size - 4;
grid = array_create(grid_w,array_create(grid_h));

dsgrid = ds_grid_create(grid_w,grid_h);

//path finding
path_offset_x = 1;
path_offset_y = 1;
global.path_grid = mp_grid_create(path_offset_x,path_offset_y,grid_w,grid_h,4,4);
path = path_add();
path_start_x = 0;
path_start_y = 0;

//path request
global.path_request_obj_id = ds_list_create();
global.path_request_granted = ds_list_create();
path_request_interval = 600;
path_request_timeout = path_request_interval * global.global_tick_interval;

//generate map
scr_grid_map_generator(0);

