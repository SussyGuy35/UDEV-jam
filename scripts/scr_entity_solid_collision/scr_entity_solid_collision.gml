// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_entity_solid_collision(){
	//xử lý va chạm
	// Horizontal
	if (place_meeting(x+hsp, y, o_entity_env_solid)) {
	      while(place_meeting(x+sign(hsp),y, o_entity_env_solid))
	      {
	         if (collision_time<=collision_timeout){
				 x -= sign(hsp);
		         
				 dir*=-1
				 
			 }
			 else {
				break
			 }
			 collision_time ++
	      }
		  collision_time = 0
		  // dir *= -1
	}	

	// Vertical
	if (place_meeting(x, y+vsp, o_entity_env_solid)){
	    while(place_meeting(x,y+sign(vsp), o_entity_env_solid))
	    {
			if (collision_time<=collision_timeout){
				y -= sign(vsp);
				on_ground = true;
			}
			else {
				break
			}
			collision_time++
	    }
		collision_time = 0
	} else {
	    state = ENTITY_STATE.IDLE;
	}
}