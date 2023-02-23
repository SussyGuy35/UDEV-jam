/*
	Tên: scr_enum
	Chức năng:
		Chứa các enumerate (các giá trị liệt kê)
		Mỗi một tên trong danh sách enumerate sẽ có thứ tự mặc định từ trên xuống
			bắt đầu từ 0 và tăng dần theo cấp số +1
		Trong một số trường hợp, ta sẽ dùng nó để gán tên cho các số 0,1,2,3,4,...
			nó sẽ giúp dễ hiểu hơn là chỉ dùng số
		Enumerate dù nằm trong hàm nhưng sẽ tự khai báo khi chạy game
			nên nếu trong code có enumerate, chương trình sẽ tự hiểu giá trị của nó
		
		Quy ước đặt tên:
			Tất cả các kí tự đều phải viết hoa.
			khoảng cách được thay thế bằng kí tự gạch chân '_'
		Cú pháp gọi:
			TEN_TAP_HOP_ENUM.TEN_CUA_ENUM
			trong đó TEN_TAP_HOP_ENUM là tên tập hợp các enum
			và TEN_CUA_ENUM là tên của enum trong tập hợp đó
			cả 2 tên được nối với nhau bằng dấu chấm
*/

/*
	Tên phương trình: enum_entity_state()
	Chức năng:
		Tự động khai báo các enumerate liên quan đến trạng thái các entity bao gồm:
			Đứng yên, di chuyển, đang rơi, chết,...
		Nó sẽ quyết định xem entity đó nên chạy hoạt cảnh nào
*/
function enum_entity_state(){
	enum ENTITY_STATE {
		IDLE,
		MOVING,
		LANDING,
		ATTACKING,
		DEAD,
		CONSTRUCTING
	}
}

function enum_structure_state() {
	enum STRUCT_STATE {
		FINISHED,
		BLUEPRINT,
		UNFINISHED,
		NEAR_FINISHED
		
	}
}