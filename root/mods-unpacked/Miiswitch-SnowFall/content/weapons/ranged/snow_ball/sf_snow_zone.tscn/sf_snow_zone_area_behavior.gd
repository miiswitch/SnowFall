extends Area2D

const SNOWFALL_LOG = "Miiswitch-SnowFall"
const SPEED_REDUCTION = 0.5 # 50% speed reduction

func _ready():
	monitoring = true
	pass # Replace with function body.

# TODO : Don't change the speed if the target is already affected by a snow zone -> Snow zone effect shouldn't stack

func _on_Area2D_body_entered(body: RigidBody2D):
	if body is Enemy:
		if(body.snow_zone_effect_count == 0):
			body.current_stats.speed = body.current_stats.speed * SPEED_REDUCTION			
		body.snow_zone_effect_count += 1
	# Change this with the player stat
	if body is Player:
		if(body.snow_zone_effect_count == 0):
			body.add_decaying_speed( - 300)
		body.snow_zone_effect_count += 1
	
func _on_Area2D_body_exited(body):
	if body is Enemy:
		if(body.snow_zone_effect_count == 0):
			body.reset_speed_stat(0)
		body.snow_zone_effect_count -= 1
	if body is Player:
		if(body.snow_zone_effect_count == 0):
			pass
		body.snow_zone_effect_count -= 1
