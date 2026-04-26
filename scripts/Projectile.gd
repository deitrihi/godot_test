extends Area2D

var speed := GameConfig.projectile_speed
var damage := GameConfig.weapon_damage
var direction := Vector2.RIGHT
var lifetime := GameConfig.projectile_lifetime
var _elapsed := 0.0

func _physics_process(delta: float) -> void:
	_elapsed += delta
	if _elapsed >= lifetime:
		queue_free()
		return
	position += direction * speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		body.take_damage(damage)
		queue_free()
