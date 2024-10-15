extends Node

@onready var timer: Timer = $Timer
@onready var hearts_container: HBoxContainer = $"../UI/HeartsContainer"
@onready var player: CharacterBody2D = $"../Player"
@onready var HeartClass = preload("res://scenes/heart.tscn")
@onready var score_panel: Control = $"../UI/Score"
@onready var pause_menu: Control = %PauseMenu
@onready var action_screen: Control = $"../UI/ActionScreen"

var score = 0
var is_paused = false

func _ready():
	hearts_container.setMaxHearts(player.MAX_HITPOINTS)
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		update_pause_menu(is_paused)
		is_paused = !is_paused

func add_point():
	score += 1
	score_panel.update_score(score)
	
func check_victory():
	if score >= 5:
		reset_game(1)
	
func reset_game(condition: int):
	action_screen.set_screen(condition)
	action_screen.show()
	Engine.time_scale = 0.5
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	action_screen.hide()
	get_tree().reload_current_scene()

func update_pause_menu(paused):
	if paused:
		pause_menu.hide()
		get_tree().paused = false
	else:
		get_tree().paused = true
		pause_menu.show()
