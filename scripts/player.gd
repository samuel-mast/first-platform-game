extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const MAX_HITPOINTS = 3

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var game_manager: Node = %GameManager
@onready var hearts_container: HBoxContainer = %HeartsContainer
@onready var effects: AnimationPlayer = $Effects


var alive = true
var hitpoints = 3

# Player takes damage
func take_damage():
	effects.play("hurt")
	hitpoints = hitpoints - 1
	hearts_container.updateHearts(hitpoints)
	if hitpoints <= 0:
		die()

# Player death
func die():
	hitpoints = 0
	hearts_container.updateHearts(hitpoints)
	alive = false
	game_manager.reset_game()
	animation_player.play("death")

func _physics_process(delta: float) -> void:
	if !alive:
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		effects.play("jump")

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flips sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
	# Plays animations
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")
		
	# Controls movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
