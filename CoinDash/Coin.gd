extends Area2D

func _ready():
	$Tween.interpolate_property($AnimatedSprite, 'modulate',
								Color(1,1,1,1), Color(1,1,1,0), 0.3,
								Tween.TRANS_QUAD, Tween.EASE_OUT)
	pass

func pickup():
	monitoring = false;
	$Tween.start()
	pass

func _on_Tween_tween_completed(object, key):
	queue_free()
	pass
