extends Resource
class_name Stats

signal health_depleted
signal health_changed(cur_health: int, max_health: int)

@export var base_max_health: int = 100
@export var base_damage: int = 50
@export var base_bullet_speed: int = 10

var curret_max_health : int = 100
var curret_damage: int = 50
var curret_bullet_speed: int = 10

var health: int = 0: set = _on_health_set

func _init() -> void:
	setup_stats.call_deferred()
	
func setup_stats() -> void:
	health = current_max_health
	
func _on_health_set(new_value: int) -> void:
	health = clampi(new_value, 0, current_max_health)
	health_changed.emit(health, curret_max_health)
	if health <= 0:
		health_depleted.emit()
		
