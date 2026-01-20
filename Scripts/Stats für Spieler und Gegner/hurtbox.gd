extends Area2D


@export_enum("Cooldown","HitOnce","DisableHitbox") var HurtBoxType = 0

@onready var collision = $CollisionShape2D
@onready var disalbetimer = $DisableTimer

signal hurt(damage)


func _on_area_entered(area: Area2D):
	if area.is_in_group("attack"):
		if not area.get("damage")==null:
			match HurtBoxType:
				0:
					collision.call_deferred("set","disalbed", true)
					disalbetimer.start()
				1:
					pass
				2:
					if area.has_method("tempdisabled"):
						area.tempdisable()
			var damage = area.damage
			emit_signal("hurt",damage)

func _on_disable_timer_timeout():
	collision.call_deferred("set","disalbed", false)
