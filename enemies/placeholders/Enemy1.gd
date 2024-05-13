extends Node2D


@onready var stats_component = $EnemyTest/StatsComponent
@onready var move_component = $EnemyTest/MoveComponent
@onready var scale_component = $EnemyTest/ScaleComponent
@onready var shake_component = $EnemyTest/ShakeComponent
@onready var visible_on_screen_notifier_2d = $EnemyTest/VisibleOnScreenNotifier2D

# Called when the node enters the scene tree for the first time.
func _ready():
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
