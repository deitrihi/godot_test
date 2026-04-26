extends CharacterBody2D

var speed := GameConfig.player_speed

func _ready() -> void:
	add_to_group("players")

var max_health := GameConfig.player_max_health
var health := GameConfig.player_max_health
var is_dead := false

func _physics_process(_delta: float) -> void:
	if is_dead:
		return

	var direction := Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	).normalized()

	velocity = direction * speed
	move_and_slide()

func take_damage(amount: int) -> void:
	if is_dead:
		return
	health -= amount
	health = max(health, 0)
	if health <= 0:
		die()

func die() -> void:
	is_dead = true
	emit_signal("player_died")

signal player_died
