extends CanvasLayer

var _choices := []

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	visible = false
	$Panel/VBoxContainer/HBoxContainer/Btn0.pressed.connect(func(): _on_btn(0))
	$Panel/VBoxContainer/HBoxContainer/Btn1.pressed.connect(func(): _on_btn(1))
	$Panel/VBoxContainer/HBoxContainer/Btn2.pressed.connect(func(): _on_btn(2))

func show_choices(_new_level: int) -> void:
	get_tree().paused = true
	visible = true
	_choices = GameConfig.upgrades.duplicate()
	_choices.shuffle()
	_choices = _choices.slice(0, 3)
	for i in 3:
		$Panel/VBoxContainer/HBoxContainer.get_child(i).text = \
			"%s\n%s" % [_choices[i]["name"], _choices[i]["desc"]]

func _on_btn(idx: int) -> void:
	_apply(_choices[idx])
	visible = false
	get_tree().paused = false

func _apply(upgrade: Dictionary) -> void:
	var player = get_tree().get_first_node_in_group("players")
	if not player:
		return
	match upgrade["type"]:
		"damage":
			var w = player.get_node_or_null("Weapon")
			if w:
				w.damage += upgrade["value"]
		"fire_rate":
			var w = player.get_node_or_null("Weapon")
			if w:
				w.fire_rate = max(GameConfig.upgrade_fire_rate_min, w.fire_rate + upgrade["value"])
		"speed":
			player.speed += upgrade["value"]
		"health":
			player.max_health += upgrade["value"]
			player.health = min(player.health + upgrade["value"], player.max_health)
