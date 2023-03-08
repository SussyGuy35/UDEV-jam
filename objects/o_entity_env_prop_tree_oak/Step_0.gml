/// @description Insert description here
// You can write your code in this editor






// Inherit the parent event
event_inherited();

//cập nhật tick khi tick timer == 0
if(global.global_tick_timer == 0) {
    tick_timer--;    
}

//cập nhật object khi tick_timer <= 0
if(tick_timer <= 0) {
    //reset tick timer
    tick_timer = tick_interval;
	
	//destroy condition
	var soil = collision_point(x,y,o_entity_env_soil,false,true);
	if(hp <= 0 or !instance_exists(soil)) instance_destroy();
	
	//tree grow
	if(grow_stage < grow_stage_max) {
		//check clearance for growth
		var blocked = false;
		var impassable = collision_rectangle(grow_clearance_left,
											grow_clearance_top,
											grow_clearance_right,
											grow_clearance_bottom,
											o_entity_env_impassable,false,true);
		var prop = collision_rectangle(grow_clearance_left,
											grow_clearance_top,
											grow_clearance_right,
											grow_clearance_bottom,
											o_entity_env_prop,false,true);
										
		if(instance_exists(impassable) and instance_exists(prop)) blocked = true;
	
		//grow if timer and chance meet
		grow_timer--;
		if(grow_timer <= 0) {
			grow_timer = grow_interval;
		
			if(!blocked) {
				var roll = random_range(0,1);
			
				if(roll <= grow_chance) {
					grow_stage++;
				}
			}
		
		}
	}
	
	//image index
	if(hp > damaged_expression_tresshold) {
		image_index = grow_stage;
	} else {
		image_index = 5 + grow_stage;
	}
}