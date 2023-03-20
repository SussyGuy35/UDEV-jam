draw_self();

if(road_blocked and road_blocked_message_on) {
	var dx = (bbox_left + bbox_right - 1) / 2;
	draw_sprite(spr_blocked,0,dx,bbox_top);
}
