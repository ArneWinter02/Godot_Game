extends Node2D

const bullet_scene = preload("res://Scenes/ShallowScenes/bullet.tscn")

@onready var marker_2d: Marker2D = $Marker2D

func _ready():
	$Camera2D/MenuScreenFade.show()
	$Camera2D/MenuScreenFade/AnimationTree.play("fade_out")
func _physics_process(_delta: float) -> void:
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
	if Input.is_action_just_pressed("shoot") and Global.magazin_cur > 0:
		Global.magazin_cur -= 1
		var bullet_instance = bullet_scene.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = marker_2d.global_position
		bullet_instance.rotation = rotation
		
	if Global.magazin_cur == 0 and $Reload.time_left == 0:
		$Reload.start()
		Global.magazin_cur = Global.magazin_max
		
