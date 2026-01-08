extends Node2D
var bullet_scene = preload("res://Scenes/ShallowScenes/bullet.tscn")
var entered = false
var checker = 0

func _on_player_shoot(_pos: Vector2, _dir: Vector2) -> void:
	pass


func _ready() -> void:
	if entered == true:
		$MenuScreenFade.show()
		$MenuScreenFade.play("fade_in")

func _on_static_body_2d_body_entered(_body: Node2D) -> void:
	print(2)
	checker = 1
	entered = true
	$MenuScreenFade/Timer.start()


func _on_timer_timeout() -> void:
		if checker == 1:
			get_tree().change_scene_to_file("res://Dandan/scene/Insel.tscn")
