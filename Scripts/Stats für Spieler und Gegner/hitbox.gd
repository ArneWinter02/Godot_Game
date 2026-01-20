extends Area2D

@export var damage = 10.0
@onready var collision = $CollisionShape2D
@onready var disabletimer = $disablehitboxtimer

func tempdisable():
	collision.call_deferred("set","disabled",true)
	disabletimer.start()

func _on_disablehitboxtimer_timeout():
	collision.call_deferred("set","disabled",false)
