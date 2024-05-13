extends Node2D
@onready var visible_on_screen_notifier_2d = $EnemyTest/VisibleOnScreenNotifier2D



# Called when the node enters the scene tree for the first time.
func _ready():
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
