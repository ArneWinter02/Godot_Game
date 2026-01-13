extends Node2D
var curMusicChecker: String
var entered = false
var checker = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if entered == true:
		$MenuScreenFade.show()
		$MenuScreenFade.play("fade_in")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if curMusicChecker != Global.musicChecker:
		curMusicChecker = Global.musicChecker
		update_music_scene()
		BackroundMusic.audio_stream_player.play()

func update_music_scene():
	var curMusic = str(curMusicChecker)
	BackroundMusic.audio_stream_player["parameters/switch_to_clip"] = curMusic
	
func _on_static_body_2d_body_entered(_body: Node2D) -> void:
	checker = 1
	entered = true
	$MenuScreenFade/Timer.start()
