extends CharacterBody2D

var direction: Vector2 = Vector2(1,1)
var speed: int = 125
var dir
signal shoot(_pos: Vector2, dir: Vector2) 

@onready var animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	$Camera2D/MenuScreenFade.show()
	$Camera2D/MenuScreenFade/AnimationTree.play("fade_out")


func _physics_process(_float):
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	animation()
	move_and_slide()
func animation():
	dir = get_local_mouse_position()
	if direction:
		animated_sprite.play("for_right")
		animated_sprite.flip_h = direction.x < 0
	else:
		if dir.x > 0:
			animated_sprite.play("idle_right")
		elif dir.x < 0:
			animated_sprite.play("idle_left")
