extends Node2D
var bullet_scene = preload("res://Scenes/ShallowScenes/bullet.tscn")
var entered = false
var checker = 0
var curMusicChecker: String

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if curMusicChecker != Global.musicChecker:
		curMusicChecker = Global.musicChecker
		update_music_scene()
		BackroundMusic.audio_stream_player.play()

func _on_static_body_2d_body_entered(_body: Node2D) -> void:
	checker = 1
	entered = true
	if entered == true:
		$MenuScreenFade.show()
		$MenuScreenFade/ScreenFadeTimer.start()
		$MenuScreenFade/AnimationTree.play("fade_in")

func update_music_scene():
	var curMusic = str(curMusicChecker)
	BackroundMusic.audio_stream_player["parameters/switch_to_clip"] = curMusic

func _on_screen_fade_timer_timeout() -> void:
	if checker == 1:
		get_tree().change_scene_to_file("res://Scenes/DeeperScene/next_level.tscn")
