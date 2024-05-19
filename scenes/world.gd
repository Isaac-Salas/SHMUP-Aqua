extends Node2D

@export var EnemyGen : WaveComponent
@export var Play = false
@onready var control = $Control/Control
@onready var player = $Player
@onready var start_timer = $StartTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	control.animation_player.play("new_animation")
	control.child_order_changed.connect(toggle)



func toggle():
	match player.shooting:
		true:
			start_timer.start(2)
			await start_timer.timeout
			start_timer.queue_free()
			Play = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	match Play:
		true:
			EnemyGen.starttimer.start()
			Play = false
		false:
			pass

func test():
	print("Acabado recibido por miundo")
