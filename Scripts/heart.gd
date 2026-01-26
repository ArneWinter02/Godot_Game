extends Area2D

@export var health = 20.0

var target = null
var speed = 0

@onready var sprite = $AnimatedSprite2D
@onready var pickup = $pickup
@onready var collision = $CollisionShape2D

func _ready():
	pass
func _physics_process(delta: float):
	if target != null:
		global_position = global_position.move_toward(target.global_position, speed)
		speed += 2*delta
func collect():
	pickup.play()
	collision.call_deferred("set","disabled",true)
	sprite.visible = false
	return health


func _on_pickup_finished() -> void:
	queue_free()
