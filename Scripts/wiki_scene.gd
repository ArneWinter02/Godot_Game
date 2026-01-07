extends Node2D
var checker = 0


func _on_main_menu_pressed() -> void:
	checker = 1
	if checker == 1:
		get_tree().change_scene_to_file("res://Scenes/UserInterface/Main_menu.tscn")
#display/window/size/viewport_width
#display/window/size/viewport_height
