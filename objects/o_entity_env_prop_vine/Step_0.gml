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
	if(hp <= 0) instance_destroy();
	
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
				var vine = instance_create_layer(x,bbox_bottom,"Structures",o_entity_env_prop_vine);
				vine_bottom = vine;
				with (vine) vine_top = other
			}
		}		
	}

	
	if(!instance_exists(vine_top)) {
		with(vine_bottom) vine_top = noone;
		if(instance_exists(collision_point(x,bbox_bottom,o_entity_env_impassable,false,true))) {
			hp = 0;
		} else y++;
	}
}