extends Node2D

var fire_rate := GameConfig.weapon_fire_rate
var damage := GameConfig.weapon_damage
var _timer := 0.0
var _proj_scene: PackedScene

func _ready() -> void:
	_proj_scene = load("res://scenes/Projectile.tscn")

func _process(delta: float) -> void:
	_timer += delta
	if _timer >= fire_rate:
		_timer = 0.0
		_fire()

func _fire() -> void:
	var enemies = get_tree().get_nodes_in_group("enemies")
	if enemies.is_empty():
		return

	var nearest: Node2D = null
	var nearest_dist := INF
	for enemy in enemies:
		var dist = global_position.distance_to(enemy.global_position)
		if dist < nearest_dist:
			nearest_dist = dist
			nearest = enemy

	if nearest == null:
		return

	var proj = _proj_scene.instantiate()
	proj.global_position = global_position
	proj.direction = (nearest.global_position - global_position).normalized()
	proj.damage = damage
	get_tree().current_scene.add_child(proj)
