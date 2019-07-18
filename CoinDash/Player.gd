extends Area2D

signal pickup;

export (float) var speed = 100.0;
var velocity;

func _ready():
	pass

func _process(delta):
	velocity = Vector2();
	if Input.is_action_pressed("ui_left"):
		velocity.x-=1
	if Input.is_action_pressed("ui_right"):
		velocity.x+=1
	if Input.is_action_pressed("ui_up"):
		velocity.y-=1
	if Input.is_action_pressed("ui_down"):
		velocity.y+=1
	position += speed*velocity.normalized()*delta;
	pass

func die():
	set_process(false)
	hide()
	pass

func _on_Player_area_entered(area):
	if area.is_in_group("pickup"):
		area.pickup();
		emit_signal("pickup");
	pass
