
// Inherit the parent event
event_inherited();

hp = 20;
tick_interval = 1;
dir = 1;

//combat statistic
hit_chance = 1;
damage = 5;
range = 16;
movespeed = 1;
attack_movespeed = 2;

//killer id
killed_by = noone;

//visible enemies data
spotted_enemies = ds_list_create();
target_enemy = noone;

//fly/ground mode
on_ground = false; //xác định xem thực thể đang đứng trên một mặt phẳng
on_ground_interval = 60;
on_ground_timer = on_ground_interval;
flying = false;
deploy_interval = 22;
deploy_timer = deploy_interval;

//path finding
path = path_add();
path_following = false;

//bullet hit area
hit_area_left	= bbox_left - 1;
hit_area_right	= bbox_right + 1;
hit_area_top	= bbox_top + 1;
hit_area_bottom = bbox_bottom - 2;