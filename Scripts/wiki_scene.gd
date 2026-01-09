extends Node2D
var checker = 0

func _ready():
	Global.musicChecker = "Menu"
func _on_main_menu_pressed() -> void:
	checker = 1
	if checker == 1:
		get_tree().change_scene_to_file("res://Scenes/UserInterface/Main_menu.tscn")
#display/window/size/viewport_width
#display/window/size/viewport_height


func _on_master_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))


func _on_music_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value))

func _on_sfx_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(value))
