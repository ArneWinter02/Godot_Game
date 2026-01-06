extends Area2D

var SPEED: int = 400

func _physics_process(delta: float) -> void:
	position += transform.x * SPEED * delta
