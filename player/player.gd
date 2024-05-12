extends RigidBody2D
@onready var spawner_component = $SpawnerComponent
@onready var centershot = $Centershot
@onready var fire_rate_timer = $FireRateTimer
@onready var scale_component = $ScaleComponent
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var move_component = $MoveComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	fire_rate_timer.timeout.connect(shoot)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animation()

func animation():
	if move_component.velocity.y<0:
		animated_sprite_2d.play("Up")
	elif move_component.velocity.y>0:
		animated_sprite_2d.play("Down")
	else:
		animated_sprite_2d.play("Center")

func shoot():
	spawner_component.spawn(centershot.global_position)
	scale_component.tween_scale()
