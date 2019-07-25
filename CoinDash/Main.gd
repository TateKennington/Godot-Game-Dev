extends Node

var score = 0
var timeleft = 30
var level = 0

export (PackedScene) var coinScene

func startGame():
	score = 0
	level = 0
	timeleft = 30
	$HUD.startGame()
	$HUD.updateTimer(timeleft)
	$HUD.updateScore(score)
	$Player.start()
	$GameplayTimer.start()
	spawnCoins(5)
	pass

func gameOver():
	$GameplayTimer.stop()
	$Player.die()
	for coin in $Coins.get_children():
		coin.queue_free()
	$HUD.gameOver()
	pass

func _on_GameplayTimer_timeout():
	timeleft-=1
	$HUD.updateTimer(timeleft)
	if timeleft == 0:
		gameOver()
	pass


func _on_Player_pickup():
	score+=1
	print($Coins.get_child_count())
	if $Coins.get_child_count() == 1:
		level += 1
		spawnCoins(5+level)
		timeleft+=5	
	$HUD.updateScore(score)	
	$HUD.updateTimer(timeleft)
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