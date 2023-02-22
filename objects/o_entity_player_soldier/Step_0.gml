//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
    if(on_ground) {
        state = ENTITY_STATE.MOVING;
    }
    
    //thực hiện hành vi dựa vào trạng thái
    switch (state) {
        case ENTITY_STATE.IDLE:
            image_index = 0;
            image_speed = 0;
            break;
            
        case ENTITY_STATE.MOVING:
            if(image_index == 2) image_index = 3; else image_index = 2;
            
            hsp = dir*movespeed;
            break;
        default:    
            break;
    }
    
    //áp dụng trọng lực
    on_ground = false;
    vsp++;
}

//xử lý va chạm
// Horizontal
if (place_meeting(x+hsp, y, o_entity_env_solid)) {
      while(place_meeting(x+sign(hsp),y, o_entity_env_solid))
      {
         x -= sign(hsp);
         if(sign(hsp) < 0) {
            dir = 1;
         } else {
            dir = -1;
         }
      }
}

// Vertical
if (place_meeting(x, y+vsp, o_entity_env_solid)){
    while(place_meeting(x,y+sign(vsp), o_entity_env_solid))
    {
        y -= sign(vsp);
        
        on_ground = true;
    }
} else {
    state = ENTITY_STATE.IDLE;
}

x += hsp;
y += vsp;
image_xscale = -dir;

hsp = 0;
vsp = 0;