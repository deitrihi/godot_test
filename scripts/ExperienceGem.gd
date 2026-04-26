extends Area2D

var xp_value := GameConfig.gem_xp_value

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		var ls = get_tree().get_first_node_in_group("level_system")
		if ls:
			ls.add_xp(xp_value)
		queue_free()
