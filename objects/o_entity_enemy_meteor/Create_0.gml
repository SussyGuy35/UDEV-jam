/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

hp = 20;

movespeed = 8;

previous_position_max = 10;
previous_pos_x = ds_list_create();
previous_pos_y = ds_list_create();

blast_radius = 10;
damage = 50;

color_set = [c_white,
				merge_color(c_white,c_yellow,0.5),
				c_yellow,
				merge_color(c_yellow,c_orange,0.5),
				c_orange,
				merge_color(c_orange,c_red,0.5),
				c_red,
				merge_color(c_red,c_black,0.5),
				c_black,
				c_gray]

//create random destination
var random_x = irandom_range(0,room_width-1);

image_angle = point_direction(x,y,random_x,room_height-1);