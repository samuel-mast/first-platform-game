extends Control

@onready var color_rect: ColorRect = $ColorRect
@onready var rich_text_label: RichTextLabel = $MarginContainer/RichTextLabel

func set_screen(type: int):
	if type == 0:
		rich_text_label.text = "You Perished"
		print(color_rect.color)
		color_rect.color = Color(.7,.05,.23,.19)
	elif type == 1:
		rich_text_label.text = "You Have Won"
		color_rect.color = Color(.69,.54,.18,.50)
