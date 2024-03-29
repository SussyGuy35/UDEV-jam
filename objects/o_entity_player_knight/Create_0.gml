soldier_count++;
// Inherit the parent event
event_inherited();

tick_interval = 1;
on_ground = false; //xác định xem thực thể đang đứng trên một mặt phẳng
dir = 1;

//combat statistic
hp = 10;
hp_max = 10;
hit_chance = 1;
damage = 6;
range = 8;
attack_interval = 4;
attack_timer = 0;
stun_power = 4;
knockback = 8;

//fire direction variable for muzzle flash location
fire_dir = 0;
muzzle_flashing = false;

//visible enemies data
spotted_enemies = ds_list_create();
target_enemy = noone;

//contruction data
range_contruction = 8;
spotted_contruction = ds_list_create();
target_contruction = noone;
speed_contruction = 1;

//ladder id
on_ladder = noone;
ladder_below = noone;

//sign instruction
instruction_direction = INSTRUCTION_DIRECTION.DOWNWARD;
instuction_report_interval = 60;
instuction_report_timer = 0;
spotted_sign = noone;

//recall
recalling = false;

//jetpack
jetpack_fuel = 180;
jetpack_standoff_range = range / 2;
jetpack_flying_interval = 150;
jetpack_spark_timer = 0;
jetpack_dir = 90;
jetpack_turning = 4;

global.swordman_created++;