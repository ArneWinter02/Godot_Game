extends Node2D

func _ready():
	$Control2/MenuScreenFade.show()
	$Control2/MenuScreenFade/AnimationTree.play("fade_out")

func _process(delta: float) -> void:
	pass
