extends Node2D
var checker = 0

func _on_start_pressed() -> void:
	checker = 1
	$Control2/MenuScreenFade.show()
	$Control2/MenuScreenFade/MenuTimer.start()
	$Control2/MenuScreenFade/AnimationTree.play("fade_in")
func _on_wiki_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UserInterface/WikiScene.tscn")
	checker = 2
func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UserInterface/Options.tscn")
	checker = 3
func _on_play_button_4_pressed() -> void:
	get_tree().quit()
func _on_menu_timer_timeout() -> void:
	Global.musicChecker = "Level"
	if checker == 1:
		get_tree().change_scene_to_file("res://Scenes/DeeperScene/Beginning.tscn")
