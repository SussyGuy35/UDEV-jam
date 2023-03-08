/*
	name: o_gaia
	porpose:
		responsible for maintaining the eco system
		this include:
			planting tree
			
		other future feature may include
			background animation
			weathers
*/

tree_plant_interval = 5;
tree_plant_timer = 0;

tick_interval = 1; //tốc độ thay đổi trong game (càng cao càng chậm)
tick_timer = 0; //hẹn giờ thay đổi. 
				//Khi <= 0 thì tick_timer = tick_counter và object này sẽ tự cập nhật