extends Area2D

const SNOWFALL_LOG = "Miiswitch-SnowFall"
const SPEED_REDUCTION = 0.5 # 50% speed reduction

func _ready():
	monitoring = true
	pass # Replace with function body.

# TODO : Don't change the speed if the target is already affected by a snow zone -> Snow zone effect shouldn't stack

func _on_Area2D_body_entered(body: RigidBody2D):
	if body is Enemy:
		body.current_stats.speed = body.current_stats.speed * SPEED_REDUCTION
	# Change this with the player stat
	if body is Player:
		body.add_decaying_speed( - 300)
	
func _on_Area2D_body_exited(body):
	if body is Enemy:
		body.reset_speed_stat(0)
	if body is Player:
		pass # reset speed of Player
