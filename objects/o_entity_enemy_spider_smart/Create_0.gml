
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

//phases
on_ground = true; //xác định xem thực thể đang đứng trên một mặt phẳng
walking_interval = 60;
walking_timer = 0;

deploy_interval = 22;
deploy_timer = 0;
undeploy = false;

flying_interval = 32;
flying_timer = flying_interval;


//path finding
path = path_add();
path_following = false;
previous_x = x;

//bullet hit area
hit_area_left	= bbox_left - 1;
hit_area_right	= bbox_right + 1;
hit_area_top	= bbox_top + 1;
hit_area_bottom = bbox_bottom - 2;