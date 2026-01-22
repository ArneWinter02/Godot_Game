extends Area2D

var speed: int = 400
var level: int
var hp = 1.0
var damage = 10
var knock_amount = 100
var attack_size = 1.0

var target = Vector2.ZERO
var angle = Vector2.ZERO



func _ready():
	angle = global_position.direction_to(target)
	rotation = angle.angle() + deg_to_rad(135)
	match level:
		1:
			hp = 1.0
			speed = 400
			damage = 10
			knock_amount = 100
			attack_size = 1.0

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta
func _on_timer_timeout() -> void:
	queue_free()
