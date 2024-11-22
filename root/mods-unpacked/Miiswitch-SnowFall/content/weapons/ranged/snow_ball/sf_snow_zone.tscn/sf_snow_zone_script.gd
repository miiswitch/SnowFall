extends Node

const TIMER_WAIT_TIME = 2.0 # In seconds

func _ready():
	# Starting a time to delete the snow zone scene after 2 seconds
	var timer := Timer.new()
	add_child(timer)
	
	timer.wait_time = TIMER_WAIT_TIME
	# Stop the timer after wait X time
	timer.one_shot = true
	timer.connect("timeout", self, "_on_timer_timeout")
	
	timer.start()
	
func _on_timer_timeout() -> void:
	# After X seconds, we destroy the snow zone
	queue_free()
	

