/*
	name: scr_soldier_attacking
	purpose:
		set image_speed = 0;
		determine the aiming direction
		call function scr_soldier_shooting
*/
function scr_knight_attacking(){
	image_speed = 0;
	//find the aim direction
	var aim_dir = point_direction(target_enemy.x,target_enemy.y,x,y);
			
	//use the sprite frame corresponding to the aim direction
	if(aim_dir >= 270 and aim_dir < 292.5) { //12 o'clock right
		scr_knight_melee(0,4,false);
				
	} else if (aim_dir >= 292.5 and aim_dir < 337.5) { //1:30
		scr_knight_melee(1,6,false);
			
	} else if ((aim_dir >= 337.5 and aim_dir < 360) or (aim_dir >= 0 and aim_dir < 22.5)) { // 3 o'clock
		scr_knight_melee(2,8,false);
				
	} else if (aim_dir >= 22.5 and aim_dir < 67.5) { //4:30
		scr_knight_melee(3,10,false);
				
	} else if (aim_dir >= 67.5 and aim_dir < 90) { //6 o' clock right
		scr_knight_melee(4,12,false);
				
	} else if (aim_dir >= 90 and aim_dir < 112.5) { //6 o'clock left
		scr_knight_melee(4,12,true);
				
	} else if (aim_dir >= 112.5 and aim_dir < 157.5) { //5:30
		scr_knight_melee(3,10,true);
								
	} else if (aim_dir >= 157.5 and aim_dir < 202.5) { //9 o'clock
		scr_knight_melee(2,8,true);
				
	} else if (aim_dir >= 202.5 and aim_dir < 247.5) { // 10:30
		scr_knight_melee(1,6,true);
				
	} else { // 12 o'clock left
		scr_knight_melee(0,4,true);
	}
}