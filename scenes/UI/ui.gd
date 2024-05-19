extends Control
@export var Player : PlayerComponent
@onready var health = $Health
@onready var stats

# Called when the node enters the scene tree for the first time.
func _ready():
	stats = Player.find_child("StatsComponent")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if stats != null:
		health.value = stats.health
	else:
		health.value = 0
