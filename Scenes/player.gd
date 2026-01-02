extends CharacterBody2D


var direction: Vector2 = Vector2(1,1)
var speed: int = 125


signal shoot(_pos: Vector2, dir: Vector2) 

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	if get_global_mouse_position().x > 0:
		pass
	else:
		$AnimatedSprite2D.flip_h
