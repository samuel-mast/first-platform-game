extends Node2D

const SPEED = 60

var direction  = 1

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: CharacterBody2D = $"../Player"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_left.is_colliding() or ray_cast_right.is_colliding():
		direction = direction * -1
		animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
		
	position.x += direction * SPEED * delta

func player_death():
	player.die()
