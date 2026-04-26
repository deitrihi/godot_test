extends CanvasLayer

@onready var health_bar: ProgressBar = $StatsPanel/HealthBar
@onready var xp_bar: ProgressBar = $StatsPanel/XPBar
@onready var level_label: Label = $StatsPanel/LevelLabel
@onready var timer_label: Label = $TimerLabel

func _ready() -> void:
	var ls = get_tree().get_first_node_in_group("level_system")
	if ls:
		ls.xp_changed.connect(_on_xp_changed)
		ls.leveled_up.connect(func(lv): level_label.text = "Lv. %d" % lv)

func _process(_delta: float) -> void:
	var player = get_tree().get_first_node_in_group("players")
	if player:
		health_bar.value = float(player.health) / float(player.max_health) * 100.0
	var game = get_parent()
	if game and "elapsed_time" in game:
		timer_label.text = "%.0fs" % game.elapsed_time

func _on_xp_changed(current: int, required: int) -> void:
	xp_bar.value = float(current) / float(required) * 100.0
