extends RigidBody2D
@onready var spawner_component = $SpawnerComponent
@onready var centershot = $Centershot
@onready var fire_rate_timer = $FireRateTimer
@onready var scale_component = $ScaleComponent
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var move_component = $MoveComponent
@onready var stats_component = $StatsComponent
@onready var move_input_component = $MoveInputComponent

var change = "Center"
var bubble = false

# Called when the node enters the scene tree for the first time.
func _ready():

	#fire_rate_timer.timeout.connect(shoot)
	pass # Replace with function body.

func _input(event):
	#print(change)
	if Input.is_action_just_pressed("ui_shoot"):
		animated_sprite_2d.flip_h = false
		change = "Shoot"
		shoot()
	elif Input.is_action_pressed("ui_left"):
		animated_sprite_2d.flip_h = true
		change = "Right_Left"
	elif Input.is_action_pressed("ui_right"):
		animated_sprite_2d.flip_h = false
		change = "Right_Left"
	elif Input.is_action_pressed("ui_up"):
		change = "Up_Down"
		animated_sprite_2d.flip_v = false
	elif Input.is_action_pressed("ui_down"):
		change = "Up_Down"
		animated_sprite_2d.flip_v = true
	else:
		change = "Center"
		bubble = true
		
		
		


	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(move_component.velocity)
	animation()

func animation():
	animated_sprite_2d.play(change)


func shoot():
	spawner_component.spawn(centershot.global_position)
	scale_component.tween_scale()
