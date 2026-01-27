extends Node2D

const bullet_scene = preload("res://Scenes/ShallowScenes/bullet.tscn")

@onready var marker_2d: Marker2D = $Marker2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var sound = $AudioStreamPlayer

var max_fire_rate: float = 0.20
var cur_fire_rate = max_fire_rate
var max_ammo: int = 10
var cur_ammo: = max_ammo


func reload():
	$reload.start()
	cur_ammo = max_ammo

func shoot():
	if not $reload.is_stopped():
		return
	cur_ammo-=1
	var bullet_instance = bullet_scene.instantiate()
	get_tree().root.add_child(bullet_instance)
	bullet_instance.global_position = marker_2d.global_position
	bullet_instance.rotation = rotation
	$fire_rate.start(0.25 - cur_fire_rate)

func _physics_process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1
	if get_global_mouse_position().x > 0:
		pass
	elif get_global_mouse_position().x < 0:
		sprite_2d.flip_h
	if not $reload.is_stopped():
		return
	if Input.is_action_just_pressed("shoot"):
		if cur_ammo > 0:
			shoot()
		else:
			reload()
			sound.play()
	elif Input.is_action_just_pressed("reload") and cur_ammo<max_ammo:
		reload()
		sound.play()
