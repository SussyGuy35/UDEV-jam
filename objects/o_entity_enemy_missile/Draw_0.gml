draw_self();

if (instance_exists(target) and debuging) {
	draw_set_color(c_red);
	draw_rectangle(target.bbox_left,target.bbox_top,target.bbox_right,target.bbox_bottom, true);
}


var alpha = 1;
draw_set_color(c_white);
draw_set_alpha(alpha);
var size = ds_list_size(trail_x);
if(size >= 2) {
	/*
	var x1 = ds_list_find_value(trail_x,size -1);
	var y1 = ds_list_find_value(trail_y,size -1);
	draw_line_width(x1,y1,x,y,5);
	alpha -= 0.1;
	draw_set_alpha(alpha);
	*/	
	for(var i = size - 1; i >= 1; i--) {
		var x1 = ds_list_find_value(trail_x,i);
		var x2 = ds_list_find_value(trail_x,i - 1);
		var y1 = ds_list_find_value(trail_y,i);
		var y2 = ds_list_find_value(trail_y,i - 1);
	
		draw_line(x1,y1,x2,y2);
		
		alpha -= 0.1;
		draw_set_alpha(alpha);
	}
}

draw_set_alpha(1);