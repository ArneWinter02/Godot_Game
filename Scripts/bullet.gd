extends Area2D

var speed: int = 400
var level: int
var hp=1
var damage = 10
var knock_amount = 100
var attack_size = 1.0

var target = Vector2.ZERO
var angle = Vector2.ZERO



func _ready():
	match level:
		1:
			hp = 1
			speed = 400
			damage = 10
			knock_amount = 100
			attack_size = 1.0

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta
func enemy_hit(charge = 1):
	hp-=charge
	if hp <= 0:
		queue_free()
	


func _on_timer_timeout() -> void:
	queue_free()
