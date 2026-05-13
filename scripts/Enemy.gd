extends CharacterBody2D

var max_health := GameConfig.enemy_base_health
var health := GameConfig.enemy_base_health
var speed := GameConfig.enemy_base_speed
var contact_damage := GameConfig.enemy_contact_damage
var damage_cooldown := GameConfig.enemy_damage_cooldown
var _damage_timer := 0.0

func _ready() -> void:
	add_to_group("enemies")

func _physics_process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group("players")
	if player == null:
		$AnimatedSprite2D.play("idle")
		return

	var dir = (player.global_position - global_position).normalized()
	velocity = dir * speed
	move_and_slide()
	$AnimatedSprite2D.play("jump")
	$AnimatedSprite2D.flip_h = dir.x < 0

	_damage_timer -= delta
	if _damage_timer <= 0.0:
		var dist = global_position.distance_to(player.global_position)
		if dist < 50.0 and player.has_method("take_damage"):
			player.take_damage(contact_damage)
			_damage_timer = damage_cooldown

func take_damage(amount: int) -> void:
	health -= amount
	health = max(0, health)
	if health <= 0:
		_drop_gem()
		queue_free()

func _drop_gem() -> void:
	var gem_scene = load("res://scenes/ExperienceGem.tscn")
	var gem = gem_scene.instantiate()
	gem.global_position = global_position
	get_tree().current_scene.add_child(gem)
