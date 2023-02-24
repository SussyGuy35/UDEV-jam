/*
	name: scr_soldier_ladder_response
	purpose:
		check what to do if there appear to be ladder on or below soldier.
		response depend of 4 conditions:
			is the soldier on ground?
			is the soldier instructed to go up or down?
			is there a ladder on soldier?
			is there a ladder below soldier?
		Therefore there are 16 possible situations, 
			some of them can be ignored
*/

function scr_soldier_ladder_response(){
	var ins_dir = 0;
	
	//checking instruction direction
	//if neither upward or downward return the function
	if(instruction_direction == INSTRUCTION_DIRECTION.UPWARD) {
		ins_dir = 1;
	} else if (instruction_direction == INSTRUCTION_DIRECTION.DOWNWARD) {
		ins_dir = -1;
	} else return noone;
	
	//ladder response
	if (on_ground and ins_dir > 0 and on_ladder and ladder_below) {
		state = ENTITY_STATE.LADDER;
		vsp--;
	} else if (!on_ground and ins_dir > 0 and on_ladder and ladder_below) {
		state = ENTITY_STATE.LADDER;
		vsp--;
	} else if (on_ground and ins_dir > 0 and on_ladder and !ladder_below) {
		state = ENTITY_STATE.LADDER;
		vsp--;
	} else if (!on_ground and ins_dir > 0 and !on_ladder and ladder_below) {
		//special condition
		//treat ladder below as ground
		on_ground = true;
		vsp--;
	} else if (!on_ground and ins_dir > 0 and on_ladder and !ladder_below) {
		state = ENTITY_STATE.LADDER;
		vsp--;
	} else if (!on_ground and ins_dir < 0 and on_ladder and ladder_below) {
		state = ENTITY_STATE.LADDER;
	} else if (on_ground and ins_dir < 0 and !on_ladder and ladder_below) {
		state = ENTITY_STATE.LADDER;
	} else if (!on_ground and ins_dir < 0 and !on_ladder and ladder_below) {
		state = ENTITY_STATE.LADDER;
	} else return noone;
}