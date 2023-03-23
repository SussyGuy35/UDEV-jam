//hit if roll success
if(repelled) {
	dice_hit = random_range(0,1);
	if(dice_hit <= hit_chance) {
		other.hp -= damage;
		if(other.hp <= 0) {
			global.killed_by_flak++;
			var asset = asset_get_index(object_get_name(other.object_index));
			if(asset == o_entity_enemy_beacon) global.shield_killed_by_flak++;
		}
	}
}