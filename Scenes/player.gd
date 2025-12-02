extends CharacterBody2D


var direction: Vector2 = Vector2(1,1)
var speed: int = 125


signal shoot(_pos: Vector2, dir: Vector2) 


func get_input():
	if Input.is_action_just_pressed("shoot") and $ReloadTimer.time_left == 0:
		shoot.emit(position, get_local_mouse_position().normalized())
		$ReloadTimer.start()



func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	get_input()
	animation()
	move_and_slide()



func animation():
	if direction:
		$AnimatedSprite2D.flip_h = direction.x < 0
	elif direction.x != 0: 
		$AnimatedSprite2D.animation = 'default'
	elif direction.y > 0:
		$AnimatedSprite2D.flip_h
	$AnimatedSprite2D.frame = 0
