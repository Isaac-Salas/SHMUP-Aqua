extends Node2D
class_name WaveComponent

@export var Wave1 = []
@onready var counter = 0

var margin = 8
var screeen_width = ProjectSettings.get_setting("display/window/size/viewport_width")

@onready var spawner_component = $SpawnerComponent
@onready var green_enemy_timer = $GreenEnemyTimer



func _ready():
	green_enemy_timer.timeout.connect(handle_spawn.bind(Wave1[counter], green_enemy_timer))

func handle_spawn(enemy_scene: PackedScene, timer):
	spawner_component.scene = enemy_scene
	var testing = spawner_component.spawn(Vector2(screeen_width, -16))
	testing.waveend.connect(next_wave)

	
	#timer.start()
	
func next_wave ():
	counter += 1
	green_enemy_timer.start()
	print("Waveended")
