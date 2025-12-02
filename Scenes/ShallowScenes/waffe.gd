extends Node2D

const bullet_scene = preload("res://Scenes/bullet.tscn")

@onready var marker_2d: Marker2D = $Marker2D

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1
		
	if get_global_mouse_position().x > 0:
		pass
	else:
		$Sprite2D.flip_h
	if Input.is_action_just_pressed("shoot"):
		var bullet_instance = bullet_scene.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = marker_2d.global_position
		bullet_instance.rotation = rotation
