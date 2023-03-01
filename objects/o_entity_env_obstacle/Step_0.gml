supporting_building = false;

//check if there's need foundation support
var building = collision_point(x,y-1,o_entity_env_construction_side_building,false,true);
if(instance_exists(building)) {
	if(building.must_grounded) {
		supporting_building = true;
	}
}

//check if there's need foundation support
var building = collision_point(x,y-1,o_entity_player_building,false,true);
if(instance_exists(building)) {
	if(building.must_grounded) {
		supporting_building = true;
	}
}

//check if there's need foundation support
var building = collision_point(x,y-1,o_entity_enemy_building,false,true);
if(instance_exists(building)) {
	if(building.must_grounded) {
		supporting_building = true;
	}
}

// Inherit the parent event
event_inherited();