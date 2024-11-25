extends Area2D

const SNOWFALL_LOG = "Miiswitch-SnowFall"
const SPEED_REDUCTION = 0.5 # 50% speed reduction

func _ready():
	monitoring = true
	pass # Replace with function body.

func _on_Area2D_body_entered(body: RigidBody2D):
	if body is Enemy:
		if(body.snow_zone_effect_count == 0):
			body.current_stats.speed = body.current_stats.speed * SPEED_REDUCTION			
		body.snow_zone_effect_count += 1
	# Change this with the player stat
	if body is Player:
		if(body.snow_zone_effect_count == 0):
			var player_index = body.get_index()
			TempStats.add_stat("stat_speed", RunData.get_player_effect("snow_zone_move_speed_modifier", player_index), player_index) # snow_zone_move_speed_modifier is negative by default
			body.update_animation(body.get_movement() if body._can_move else Vector2.ZERO) # It seems stats to not update that frequently, so I call this to force the speed update
		body.snow_zone_effect_count += 1
	
func _on_Area2D_body_exited(body):
	if body is Enemy:
		if(body.snow_zone_effect_count == 1):
			body.reset_speed_stat(0)
		body.snow_zone_effect_count -= 1
	if body is Player:
		if(body.snow_zone_effect_count == 1):
			var player_index = body.get_index()
			TempStats.remove_stat("stat_speed", RunData.get_player_effect("snow_zone_move_speed_modifier", player_index), player_index)
			body.update_animation(body.get_movement() if body._can_move else Vector2.ZERO)
		body.snow_zone_effect_count -= 1
