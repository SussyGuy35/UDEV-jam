/*
	Name: scr_contruction_side_building_update
	purpose:
		Update contruction side for building to match the data of the to be built building
		Some data have to be update manually throught this code
			because of some errors happen when getting variables
			from object index
*/
function scr_construction_side_building_update(obj_index){
	switch (obj_index) {
		case o_entity_enemy_building_gate:
			side_update = false;
			hp = 1000;
			hp_max = 1000;
			side_to_build_sprite = spr_gate;
			side_w = 24;
			side_h = 24;
			side_xoffset = 12;
			side_yoffset = 12;
			side_must_be_grounded = false;
			must_grounded = side_must_be_grounded;
			break;
		case o_entity_player_building_turret_flak:
			side_update = false;
			hp = 1
			hp_max = 100;
			side_to_build_sprite = spr_flak_turret;
			side_w = 12;
			side_h = 12;
			side_xoffset = 6;
			side_yoffset = 12;
			side_must_be_grounded = true;
			must_grounded = side_must_be_grounded;
			break;
		case o_entity_player_building_tent:
			side_update = false;
			hp_max = 100;
			side_to_build_sprite = spr_building_tent;
			side_w = 20;
			side_h = 20;
			side_xoffset = 14;
			side_yoffset = 20;
			side_must_be_grounded = true;
			must_grounded = true;
			break;
		default:
		
			break;
	}
}