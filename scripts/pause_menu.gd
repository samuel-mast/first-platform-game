extends Control



func _on_resume_pressed() -> void:
	Input.action_press("pause")
	Input.action_release("pause")


func _on_exit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	
