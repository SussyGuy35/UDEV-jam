/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

hp = 20;
tick_interval = 1;
on_ground = false; //xác định xem thực thể đang đứng trên một mặt phẳng
dir = 1;

//combat statistic
hit_chance = 1;
damage = 5;
range = 16;
movespeed = 1;
attack_movespeed = 1;

//killer id
killed_by = noone;

//visible enemies data
spotted_enemies = ds_list_create();
target_enemy = noone;

//bullet hit area
hit_area_left	= bbox_left - 1;
hit_area_right	= bbox_right + 1;
hit_area_top	= bbox_top + 1;
hit_area_bottom = bbox_bottom - 2;