extends HBoxContainer

@onready var HeartClass = preload("res://scenes/heart.tscn")


func setMaxHearts(numHearts: int):
	for i in range(numHearts):
		var heart = HeartClass.instantiate()
		add_child(heart)

func updateHearts(currentHealth: int):
	var hearts = get_children()
	for i in range(currentHealth):
		hearts[i].update(true)
	for i in range(currentHealth, hearts.size()):
		hearts[i].update(false)
