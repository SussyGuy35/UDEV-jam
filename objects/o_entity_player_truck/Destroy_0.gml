var center_x = (bbox_left + bbox_right) / 2 - 1;
instance_create_layer(center_x,y,"Bullets",o_gfx_explosion_big);
playsound_explosion1 = true;
global.truck_lost--;