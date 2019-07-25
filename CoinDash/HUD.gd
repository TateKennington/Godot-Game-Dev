extends CanvasLayer

signal game_start

func updateTimer(value):
	$MarginContainer/TimeLabel.text = str(value)
	pass

func updateScore(value):
	$MarginContainer/ScoreLabel.text = str(value)
	pass

func startGame():
	$MarginContainer/TimeLabel.show()
	$MarginContainer/ScoreLabel.show()
	$StartButton.hide()
	$StartButton.disabled = true
	pass

func gameOver():
	$GameoverTimer.start()
	$GameoverLabel.show()
	pass

func _on_StartButton_pressed():
	$StartButton.hide()
	$StartButton.disabled = true
	emit_signal("game_start")
	pass


func reset():
	$GameoverLabel.hide()
	$StartButton.show()
	$StartButton.disabled = false;
	$MarginContainer/TimeLabel.hide()
	$MarginContainer/ScoreLabel.hide()
	pass
