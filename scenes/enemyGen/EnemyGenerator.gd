extends Node2D
class_name WaveComponent

@export var Waves = [] 
var counter = 0
var testing
var margin = 8
var screeen_width = ProjectSettings.get_setting("display/window/size/viewport_width")

@onready var spawner_component = $SpawnerComponent
@onready var green_enemy_timer = $GreenEnemyTimer



func _ready():
	green_enemy_timer.timeout.connect(handle_spawn.bind(Waves[counter], green_enemy_timer))
	

func handle_spawn(enemy_scene: PackedScene, timer):
	
	spawner_component.scene = enemy_scene
	testing = spawner_component.spawn(Vector2(screeen_width, -16))
	testing.waveend.connect(next_wave)
	
	
	#timer.start()
	
func next_wave ():
	green_enemy_timer.timeout.disconnect(handle_spawn.bind(Waves[counter], green_enemy_timer))
	if counter < (len(Waves)-1):
		counter += 1
	else:
		print("OUTOFWAVES")
	print(counter)
	green_enemy_timer.timeout.connect(handle_spawn.bind(Waves[counter], green_enemy_timer))
	green_enemy_timer.start()
	print("Waveended")
