if(side_placed) draw_self();


if(!side_placed) {
	//locate the bbox
	var x1 = mouse_x - side_xoffset -1;
	var y1 = mouse_y - side_yoffset -1;
	x1 -= x1 mod grid_size;
	y1 -= y1 mod grid_size;
	var x2 = x1 + side_w - 1;
	var y2 = y1 + side_h - 1;
	
	//draw bbox
	draw_set_color(c_white);
	draw_set_alpha(0.5);
	draw_rectangle(x1,y1,x2,y2,true);
	
	//draw to build's sprite
	draw_sprite_ext(side_to_build_sprite,0,x1 + side_xoffset,y1+ side_yoffset + 1,1,1,0,c_white,0.5);

	var is_grounded = true;
	if(side_must_be_grounded) {
		//checking if grounded
		for(var i = x1; i < x2; i += grid_size) {
			//check if there's potiential foundation
			var obstacle = collision_point(i,y2 + 1,o_entity_env_obstacle,false,true);
			var solid_obj = collision_point(i,y2 + 1,o_entity_env_solid,false,true);
	
			//check if check box is fully covered by foundation
			var fully_covered_obs = false;
			var fully_covered_sol = false;
			if(instance_exists(obstacle)) {
				fully_covered_obs = i == obstacle.x and y2 +1 == obstacle.y;
			}
			if(instance_exists(solid_obj)) {
				fully_covered_sol = i == solid_obj.x and y2 +1== solid_obj.y;
			}
	
			//draw check box red if no valid foundation found otherwise draw it green
			if(fully_covered_obs or fully_covered_sol) {
				draw_set_alpha(0.5);
				draw_set_color(c_green);
				draw_rectangle(i,y2+1,i+3,y2+4,false);
			} else {
				draw_set_alpha(1);
				draw_set_color(c_red);
				draw_line(i,y2,i,y2+4);
				is_grounded = false;
			}
		}
	} 
} else {
	image_alpha = 0.5 / hp_max * hp + 0.25
	//draw bbox
	draw_set_color(c_white);
	draw_set_alpha(0.5);
	draw_rectangle(bbox_left,bbox_top,bbox_right - 1,bbox_bottom - 1,true);
}

//press mouse right to place the building if possible
if(mouse_check_button_pressed(mb_right) and !side_placed) {
	//check if the building can be placed
	var can_be_placed = true;
	if(side_must_be_grounded and !is_grounded) {
		can_be_placed = false;
	}
	
	//place building side if all condition passed
	if(can_be_placed) {
		side_placed = true;
		var build_UI = instance_nearest(x,y,o_UI_building);
		if(instance_exists(build_UI)) {
			//if(build_UI.building_side == self) 
			build_UI.building_side = noone;
			build_UI.building_side = instance_create_layer(mouse_x,mouse_y,"Bullets",o_entity_env_construction_side_building);
			build_UI.building_side.side_to_build = side_to_build;
			build_UI.building_side.side_update = true;
		}
		sprite_index = side_to_build_sprite;
		x = x1 + side_xoffset;
		y = y1 + side_yoffset;
	}
}



//reset draw alpha and color
draw_set_alpha(1);
//draw_set_color(c_white);
