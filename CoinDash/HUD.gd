extends CanvasLayer

signal game_start

func updateTimer(value):
	$MarginContainer/TimeLabel.text = str(value)
	pass

func updateScore(value):
	$MarginContainer/ScoreLabel.text = str(value)
	pass

func _on_StartButton_pressed():
	$StartButton.hide()
	$StartButton.disabled = true
	emit_signal("game_start")
	pass
