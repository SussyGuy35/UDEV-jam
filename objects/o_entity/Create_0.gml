/*
	Tên: o_entity
	Chức năng: Đây là mẹ của các entity (thực thể). 
	Mỗi entity sẽ có các thông số trạng thái và hành vi khác nhau.
	Entity sẽ phân làm 3 nhánh chính:
		-Entity của người chơi
		-Entity của máy tính.
		-Entity của môi trường.
*/

//các biến về chyển động
movespeed = 1; //tốc độ di chuyển
hsp = 0;
vsp = 0;

tick_interval = 1; //tốc độ thay đổi trong game (càng cao càng chậm)
tick_timer = 0; //hẹn giờ thay đổi. 
				//Khi <= 0 thì tick_timer = tick_counter và object này sẽ tự cập nhật
				
hp = 1; //máu của đối tượng. Nếu <= 0 thì đối tượng sẽ chết.

state = ENTITY_STATE.IDLE; //trạng thái hoạt cảnh của thực thể.
							//để biết thêm chi tiết hãy xem script tại:
							//Scripts/scr_enum
							
dead_despawn_timer = 24;

// Collision timeout
collision_timeout = 2
collision_time = 0