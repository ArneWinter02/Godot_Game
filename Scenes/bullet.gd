extends Area2D

var direction: Vector2

func setup(pos:Vector2, dir:Vector2):
	position = pos + dir * 18 # position wo die kugel rauskommen soll
	direction = dir
	
func _physics_process(delta: float) -> void:
	position += direction * 250 * delta
