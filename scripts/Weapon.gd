extends Node2D

var fire_rate := GameConfig.weapon_fire_rate
var damage := GameConfig.weapon_damage
var _timer := 0.0
var _proj_scene: PackedScene

func _ready() -> void:
	_proj_scene = load("res://scenes/Projectile.tscn")

func _process(delta: float) -> void:
	_timer += delta

	var nearest := _get_nearest_enemy()
	if nearest == null:
		return

	var aim_dir := (nearest.global_position - global_position).normalized()
	get_parent().set_turret_direction(aim_dir)

	if _timer >= fire_rate:
		_timer = 0.0
		_fire(nearest, aim_dir)

func _get_nearest_enemy() -> Node2D:
	var nearest: Node2D = null
	var nearest_dist := INF
	for enemy in get_tree().get_nodes_in_group("enemies"):
		var dist = global_position.distance_to(enemy.global_position)
		if dist < nearest_dist:
			nearest_dist = dist
			nearest = enemy
	return nearest

func _fire(nearest: Node2D, direction: Vector2) -> void:
	var proj = _proj_scene.instantiate()
	proj.global_position = global_position
	proj.direction = direction
	proj.damage = damage
	get_tree().current_scene.add_child(proj)
	$ShootSound.play()
