extends Node

@onready var timer: Timer = $Timer
@onready var hearts_container: HBoxContainer = $"../UI/HeartsContainer"
@onready var player: CharacterBody2D = $"../Player"
@onready var HeartClass = preload("res://scenes/heart.tscn")


var score = 0

func _ready():
	hearts_container.setMaxHearts(player.MAX_HITPOINTS)

func add_point():
	score += 1
	print("score")
	
func reset_game():
	Engine.time_scale = 0.5
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
