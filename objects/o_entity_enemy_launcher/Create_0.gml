/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

hp = 20;
on_ground = false; //xác định xem thực thể đang đứng trên một mặt phẳng
dir = 1;
image_speed = 0;

phase_moving = 60;
phase_deploy = 24;
phase_scaning = 60;
phase_launching = 11;
phase_timer = phase_moving;
phase_index = 0;

target = noone;
target_list = ds_list_create();

//bullet hit area
hit_area_left	= bbox_left - 1;
hit_area_right	= bbox_right + 1;
hit_area_top	= bbox_top + 1;
hit_area_bottom = bbox_bottom - 2;