extends Control

func _ready() -> void:
	var t := GameData.survived_time
	var minutes := int(t) / 60
	var seconds := int(t) % 60
	$CenterContainer/VBoxContainer/TimeLabel.text = "Survived: %02d:%02d" % [minutes, seconds]
	$CenterContainer/VBoxContainer/RestartButton.pressed.connect(_on_restart)
	$CenterContainer/VBoxContainer/MenuButton.pressed.connect(_on_menu)

func _on_restart() -> void:
	get_tree().change_scene_to_file("res://scenes/Game.tscn")

func _on_menu() -> void:
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
