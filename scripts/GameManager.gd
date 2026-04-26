extends Node

var elapsed_time := 0.0
var is_game_over := false

func _ready() -> void:
	$LevelSystem.leveled_up.connect($LevelUpUI.show_choices)
	var player = get_tree().get_first_node_in_group("players")
	if player:
		player.player_died.connect(_on_player_died)

func _process(delta: float) -> void:
	if is_game_over:
		return
	elapsed_time += delta

func _on_player_died() -> void:
	game_over()

func game_over() -> void:
	is_game_over = true
	GameData.survived_time = elapsed_time
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://scenes/GameOver.tscn")
