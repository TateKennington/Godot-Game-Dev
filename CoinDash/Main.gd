extends Node

var score = 0
var timeleft = 0

func _on_GameplayTimer_timeout():
	$Player.die();
	pass


func _on_Player_pickup():
	score+=1
	print(str(score))
	pass
