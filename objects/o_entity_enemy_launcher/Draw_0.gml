draw_self();

if (instance_exists(target) and debuging) {
	draw_set_color(c_red);
	draw_rectangle(target.bbox_left,target.bbox_top,target.bbox_right,target.bbox_bottom, true);
}