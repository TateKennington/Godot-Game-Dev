extends Node

var score = 0
var timeleft = 30

export (PackedScene) var coinScene

func startGame():
	score = 0;
	timeleft = 30;
	$HUD.updateScore(score)
	$HUD.updateTimer(timeleft)
	$Player.start()
	$GameplayTimer.start()
	spawnCoins(1)
	pass

func gameOver():
	$GameplayTimer.stop()
	$Player.die()
	for coin in $Coins.get_children():
		coin.queue_free()
	$HUD/StartButton.show()
	$HUD/StartButton.disabled = false
	pass

func _on_GameplayTimer_timeout():
	timeleft-=1
	$HUD.updateTimer(timeleft)
	if timeleft == 0:
		gameOver()
	pass


func _on_Player_pickup():
	score+=1
	timeleft+=2
	$HUD.updateScore(score)	
	$HUD.updateTimer(timeleft)
	spawnCoins(1)
	pass

func spawnCoins(num):
	for i in range(num):
		var c = coinScene.instance()
		var screenSize = get_viewport().get_visible_rect().size;
		$Coins.add_child(c)
		c.position = Vector2(rand_range(0, screenSize.x), rand_range(0, screenSize.y))
		while $Player.position.distance_to(c.position) < 300:
			c.position = Vector2(rand_range(0, screenSize.x), rand_range(0, screenSize.y))
	pass