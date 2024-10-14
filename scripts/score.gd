extends Control

@onready var score_label: RichTextLabel = $MarginContainer/Score/ScoreLabel

var score_text = ""

func update_score(score: int):
	if score < 10:
		score_text = "0"+str(score)
	else:
		score_text = str(score)
	score_label.text = score_text
