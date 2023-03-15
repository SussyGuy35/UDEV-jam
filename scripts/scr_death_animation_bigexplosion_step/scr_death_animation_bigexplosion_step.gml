// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_death_animation_bigexplosion_step(){
	var cen_x = (bbox_left + bbox_right) / 2;
	var cen_y = (bbox_top + bbox_bottom) / 2;
	for(var i = 0; i < particle_per_frame; i++) {
			var rx = irandom_range(cen_x - particle_range,cen_x +particle_range);
			var ry = irandom_range(cen_y -particle_range,cen_y+particle_range);
			ds_list_add(particle_x,rx);
			ds_list_add(particle_y,ry);
		}
		
		for (var i = 0; i < ds_list_size(particle_x); i++) {
			var nx = ds_list_find_value(particle_x,i);
			var ny = ds_list_find_value(particle_y,i);
			
			var dir = point_direction(nx,ny,cen_x, cen_y);
			
			nx += lengthdir_x(particle_speed,dir);
			ny += lengthdir_y(particle_speed,dir);
			
			ds_list_replace(particle_x,i,nx);
			ds_list_replace(particle_y,i,ny);
		}
}