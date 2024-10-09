extends Panel

@onready var sprite_2d: Sprite2D = $Sprite2D

func update(full: bool):
	if full: sprite_2d.frame = 0
	else: sprite_2d.frame = 2
