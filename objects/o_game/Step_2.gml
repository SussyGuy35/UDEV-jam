//reset lại timer mỗi khi nó <= 0
//lý do nó nằm ở event End Step là vì trong khoảng thời gian nó <= 0.
//Các entity sẽ lấy đó làm điều kiện để cập nhật.
global.global_tick_timer--;
if(global.global_tick_timer < 0) global.global_tick_timer = global.global_tick_interval - 1;
if(global.global_tick_timer == 0) recall_allow = true;
