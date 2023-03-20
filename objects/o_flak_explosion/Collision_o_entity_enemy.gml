//hit if roll success
if(repelled) {
	dice_hit = random_range(0,1);
	if(dice_hit <= hit_chance) {
		other.hp -= damage;
	}
}