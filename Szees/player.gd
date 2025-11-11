extends CharacterBody2D

var direction: Vector2 = Vector2(1,1)
var speed: int = 150

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("space"):
		print('HEPPPPPPPPPPPPPPPPPP')
