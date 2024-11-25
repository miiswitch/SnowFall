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
			var player_index = body.get_index()
			RunData.players_data[player_index].effects["stat_speed"] = RunData.players_data[player_index].effects["stat_speed"] + RunData.players_data[player_index].effects["snow_zone_move_speed_modifier"] # snow_zone_move_speed_modifier is negative by default
		body.snow_zone_effect_count += 1
	
func _on_Area2D_body_exited(body):
	if body is Enemy:
		if(body.snow_zone_effect_count == 1):
			body.reset_speed_stat(0)
		body.snow_zone_effect_count -= 1
	if body is Player:
		if(body.snow_zone_effect_count == 1):
			var player_index = body.get_index()
			RunData.players_data[player_index].effects["stat_speed"] = RunData.players_data[player_index].effects["stat_speed"] - RunData.players_data[player_index].effects["snow_zone_move_speed_modifier"]
		body.snow_zone_effect_count -= 1
