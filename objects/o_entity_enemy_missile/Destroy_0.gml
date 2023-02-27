instance_create_layer(x,y,"Bullets",o_gfx_explosion);

target_list = ds_list_create();
collision_circle_list(x,y,blast_radius,o_entity_env,false,true,target_list,false);

for (var i = 0; i < ds_list_size(target_list); i++) {
	var _target = ds_list_find_value(target_list,i);
	with(_target) {
		hp -= other.damage;
	}
}

ds_list_clear(target_list);
collision_circle_list(x,y,blast_radius,o_entity_player,false,true,target_list,false);

for (var i = 0; i < ds_list_size(target_list); i++) {
	var _target = ds_list_find_value(target_list,i);
	with(_target) {
		hp -= other.damage;
	}
}

playsound_missile_explode = true;