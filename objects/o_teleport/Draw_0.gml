draw_self();
if(image_alpha == 0) {
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_line(x,y+ 4,x, y - 4);
}