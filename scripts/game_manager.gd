extends Node

@onready var timer: Timer = $Timer

var score = 0

func add_point():
	score += 1
	print("score")
	
func reset_game():
	Engine.time_scale = 0.5
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
