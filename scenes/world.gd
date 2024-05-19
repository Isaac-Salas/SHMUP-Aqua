extends Node2D

@export var EnemyGen : WaveComponent
@export var Ready = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#animation_player.play("Intro")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	match Ready:
		true:
			EnemyGen.starttimer.start()
			Ready = false
		false:
			pass
