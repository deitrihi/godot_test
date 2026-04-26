extends Node

signal leveled_up(new_level: int)
signal xp_changed(current_xp: int, required_xp: int)

var level := 1
var current_xp := 0
var xp_to_next := GameConfig.xp_to_next_level

func _ready() -> void:
	add_to_group("level_system")

func add_xp(amount: int) -> void:
	current_xp += amount
	xp_changed.emit(current_xp, xp_to_next)
	while current_xp >= xp_to_next:
		current_xp -= xp_to_next
		level += 1
		xp_to_next = int(xp_to_next * GameConfig.xp_level_multiplier)
		leveled_up.emit(level)
		xp_changed.emit(current_xp, xp_to_next)
