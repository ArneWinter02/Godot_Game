extends CharacterBody2D
@export var healthpoints = 20.0
var direction = Vector2()
@export var speed = 70.0
@onready var player = get_tree().get_first_node_in_group("player") #In der Node verankerte Gruppe für den Spieler

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D #in der Szene verankerte 2D animation
func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*speed
	move_and_slide()
	if direction.x:
		animated_sprite_2d.play("Right")
		animated_sprite_2d.flip_h = direction.x < 0


func _on_hurtbox_hurt(damage: Variant) -> void:
	healthpoints -= damage
	if healthpoints <= 0:
		queue_free()
	print(healthpoints)
