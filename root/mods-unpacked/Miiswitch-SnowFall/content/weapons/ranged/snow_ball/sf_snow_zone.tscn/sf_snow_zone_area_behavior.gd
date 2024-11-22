extends Area2D

const SNOWFALL_LOG = "Miiswitch-SnowFall"

func _ready():
	monitoring = true
	pass # Replace with function body.

# TODO : Don't change the speed if the target is already affected by a snow zone -> Snow zone effect shouldn't stack

func _on_Area2D_body_entered(body: RigidBody2D):
	# Change this to decrease the speed of the monster while he is on snow, not decaying
	if body is Enemy:
		body.add_decaying_speed( - 300)
	# Change this with the player stat
	if body is Player:
		body.add_decaying_speed( - 300)
	
func _on_Area2D_body_exited(body):
	if body is Enemy:
		pass # reset speed of ennemy
	if body is Player:
		pass # reset speed of Player
