extends Resource
class_name Stats

enum Buffable{
	MAX_HEALTH,
	DAMAGE,
	BULLET_SPEED,
	INVENTORY,
	ITEMS,
}

signal health_depleted
signal health_changed(cur_health: int, max_health: int)

@export var base_max_health: int = 100
@export var base_damage: int = 50
@export var base_bullet_speed: int = 10

var inventory: int = 0
var items: int = 0
var current_max_health: int = 100
var current_damage: int = 50
var current_bullet_speed: int = 10

var health: int = 0: set = _on_health_set

func _init() -> void:
	setup_stats.call_deferred()
	
func setup_stats() -> void:
	recalculate_stats()
	health = current_max_health
	
func recalculate_stats() -> void:
	pass
func _on_health_set(new_value: int) -> void:
	health = clampi(new_value, 0, current_max_health)
	health_changed.emit(health, current_max_health)
	if health <= 0:
		health_depleted.emit()
func _on_items_set(new_items: int) -> void:
	var _inventory_old: int = items
	inventory = new_items
	
	if not inventory == items:
		recalculate_stats()
