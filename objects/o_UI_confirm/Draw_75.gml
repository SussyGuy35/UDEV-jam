
//draw box background
draw_set_color(global.textbox_color_background);
draw_set_alpha(0.5);
	
draw_roundrect(x1,y1,x2,y2,false);
	
draw_set_color(global.textbox_color_border);
draw_set_alpha(1);
draw_roundrect(x1 + 1, y1 + 1, x2 - 1, y2 - 1, true);

draw_set_halign(fa_center);
draw_text(room_mid_w,text_origin_y,str);

//yes button
var mx1 = room_mid_w - button_w - button_half_spacing;
var mx2 = mx1 + button_w;
var my1 = text_origin_y + string_h;
var my2 = my1 + button_h;

hovering = false;
if(mouse_x >= mx1 and mouse_x <= mx2 and mouse_y >= my1 and mouse_y <= my2) {
	hovering = true;
	if(mouse_check_button_pressed(mb_left)) press_at = 1;
	if(mouse_check_button(mb_left)) {
		draw_sprite_ext(spr_UI_button_yesno,1,mx1,my1,1,1,0,c_green,1);
		draw_set_color(c_gray)
		draw_text((mx1 + mx2) /2, my1 + 4, str_yes);
	} else {
		draw_sprite_ext(spr_UI_button_yesno,0,mx1,my1,1,1,0,c_white,1);
		draw_set_color(c_yellow)
		draw_text((mx1 + mx2) /2, my1 + 4, str_yes);
	}
} else {
	draw_sprite_ext(spr_UI_button_yesno,0,mx1,my1,1,1,0,c_green,1);
	draw_set_color(c_white)
	draw_text((mx1 + mx2) /2, my1 + 4, str_yes);
}

//no button
var mx1 = room_mid_w + button_half_spacing;
var mx2 = mx1 + button_w;

if(mouse_x >= mx1 and mouse_x <= mx2 and mouse_y >= my1 and mouse_y <= my2) {
	hovering = true;
	if(mouse_check_button_pressed(mb_left)) press_at = 0;
	if(mouse_check_button(mb_left)) {
		draw_sprite_ext(spr_UI_button_yesno,1,mx1,my1,1,1,0,c_red,1);
		draw_set_color(c_gray)
		draw_text((mx1 + mx2) /2, my1 + 4, str_no);
	} else {
		draw_sprite_ext(spr_UI_button_yesno,0,mx1,my1,1,1,0,c_white,1);
		draw_set_color(c_yellow)
		draw_text((mx1 + mx2) /2, my1 + 4, str_no);
	}
} else {
	draw_sprite_ext(spr_UI_button_yesno,0,mx1,my1,1,1,0,c_red,1);
	draw_set_color(c_white)
	draw_text((mx1 + mx2) /2, my1 + 4, str_no);
}

if(!hovering) press_at = -1;
if(mouse_check_button_released(mb_left)) {
	if(press_at == 0) {
		var asset = asset_get_index(object_get_name(host.object_index));
		var hx = host.x;
		var hy = host.y;
		instance_destroy(host);
		instance_create_layer(hx,hy,"Instances",asset);
		instance_destroy();
	} else if (press_at == 1) {
		loading = true;
		var asset = asset_get_index(object_get_name(host.object_index));
		var hx = host.x;
		var hy = host.y;
		instance_destroy(host);
		with(instance_create_layer(hx,hy,"Instances",asset)) {
			button_slideout = true;
			if(other.userevent_index >= 0)
				event_user(other.userevent_index);
				
			if(other.alarm_index >= 0)
				alarm_set(other.alarm_index,other.alarm_interval);
		}
		instance_destroy();
	}
}