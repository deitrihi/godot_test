extends Node

var spawn_interval := GameConfig.spawn_interval_initial
var spawn_radius := GameConfig.spawn_radius
var _timer := 0.0
var _scale_timer := 0.0
var _difficulty := 1
var _enemy_scene: PackedScene

func _ready() -> void:
	_enemy_scene = load("res://scenes/Enemy.tscn")

func _process(delta: float) -> void:
	_timer += delta
	_scale_timer += delta
	if _scale_timer >= GameConfig.difficulty_scale_interval:
		_scale_timer = 0.0
		_difficulty += 1
		spawn_interval = max(GameConfig.spawn_interval_min, spawn_interval - GameConfig.spawn_interval_decrease)
	if _timer >= spawn_interval:
		_timer = 0.0
		_spawn()

func _spawn() -> void:
	var player = get_tree().get_first_node_in_group("players")
	if player == null:
		return
	var angle := randf() * TAU
	var offset := Vector2(cos(angle), sin(angle)) * spawn_radius
	var enemy = _enemy_scene.instantiate()
	enemy.global_position = player.global_position + offset
	enemy.max_health = GameConfig.enemy_base_health + (_difficulty - 1) * GameConfig.enemy_health_per_difficulty
	enemy.health = enemy.max_health
	enemy.speed = GameConfig.enemy_base_speed + (_difficulty - 1) * GameConfig.enemy_speed_per_difficulty
	get_tree().current_scene.add_child(enemy)
