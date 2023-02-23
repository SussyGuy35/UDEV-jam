
// Inherit the parent event
event_inherited();

tick_interval = 1;
on_ground = false; //xác định xem thực thể đang đứng trên một mặt phẳng
dir = 1;

//combat statistic
hit_chance = 0.5;
damage = 1;
range = 60;

//fire direction variable for muzzle flash location
fire_dir = 0;
muzzle_flashing = false;

//visible enemies data
spotted_enemies = ds_list_create();
target_enemy = noone;