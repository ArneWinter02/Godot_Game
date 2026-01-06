extends CharacterBody2D


var speed = 50

var health = 100
var damage = 10

var dead = false
var player_in_area = false
var player = null

func _ready():
	dead = false
func _physics_process(_delta):
	if !dead:
		$detection_area/CollisionShape2D.disabled = false
		if player_in_area:
			position += (player.position - position) / speed
			$AnimatedSprite2D.play("move")
		else:
			$AnimatedSprite2D.play("idle")
	if dead:
		$detection_area/CollisionShape2D.disabled = true


func _on_detection_area_body_entered(body):
		player = body
		player_in_area = true
		
		
func _on_detection_area_body_exited(_body):
		player = null
		player_in_area = false


func _on_hitbox_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
