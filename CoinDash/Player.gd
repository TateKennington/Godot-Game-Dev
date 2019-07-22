extends Area2D

signal pickup;

export (float) var speed = 100.0;
var velocity;

func _ready():
	set_process(false)
	hide()
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
	if position.x < $CollisionShape2D.shape.get_extents().x/2:
		position.x = $CollisionShape2D.shape.get_extents().x/2
	if position.y < $CollisionShape2D.shape.get_extents().y/2:
		position.y = $CollisionShape2D.shape.get_extents().y/2
	if position.x > get_viewport().get_visible_rect().size.x - $CollisionShape2D.shape.get_extents().x/2:
		position.x = get_viewport().get_visible_rect().size.x -$CollisionShape2D.shape.get_extents().x/2
	if position.y > get_viewport().get_visible_rect().size.y - $CollisionShape2D.shape.get_extents().y/2:
		position.y = get_viewport().get_visible_rect().size.y -$CollisionShape2D.shape.get_extents().y/2

	pass

func start():
	show()
	set_process(true)
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
