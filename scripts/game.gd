extends Node2D

@onready var player: CharacterBody2D = $Player

func player_death():
	player.die()
