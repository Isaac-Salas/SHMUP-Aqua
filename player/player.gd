extends RigidBody2D
class_name PlayerComponent
@onready var spawner_component = $SpawnerComponent
@onready var centershot = $Centershot
@onready var fire_rate_timer = $FireRateTimer
@onready var scale_component = $ScaleComponent
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var move_component = $MoveComponent
@onready var stats_component = $StatsComponent
@onready var move_input_component = $MoveInputComponent
@onready var hurtbox_component = $HurtboxComponent
@onready var shake_component = $ShakeComponent
@onready var cntshot = load("res://projectiles/center_shot.tscn")
@export var ammo = 0

var change = "Center"
var bubble = false
var shooting = false
var eating = false
var punching = false
var lefting = false

# Called when the node enters the scene tree for the first time.
func _ready():
	hurtbox_component.hurt.connect(func(Hitbox : HitboxComponent):
		scale_component.tween_scale()
		shake_component.tween_shake()
		)


func _process(_delta):
	animation()
	evaluate()
	shooting = Input.is_action_just_pressed("ui_shoot")
	eating = Input.is_action_just_pressed("ui_eat")
	punching = Input.is_action_just_pressed("ui_punch")
	#print(shooting)



func _input(_event):
	if Input.is_anything_pressed():
		if Input.is_action_pressed("ui_left"):
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
		#await animated_sprite_2d.animation_finished
		change = "Center"
		
		
		
		
		


	

# Called every frame. 'delta' is the elapsed time since the previous frame.


func evaluate():
	match shooting:
		true:
			if ammo > 0:
				ammo -= 1
				animated_sprite_2d.flip_h = false
				change = "Shoot"
				spawner_component.spawn(centershot.global_position)
				scale_component.tween_scale()
			else:
				scale_component.tween_scale()

	match eating:
		true:
			animated_sprite_2d.flip_h = false
			change = "Eat"
			scale_component.tween_scale()
		false:
			pass
	
	match punching:
		true:
			animated_sprite_2d.flip_h = false
			change = "Punch"
			scale_component.tween_scale()


func animation():
	animated_sprite_2d.play(change)

func shoot():
	spawner_component.scene = cntshot
	spawner_component.spawn(centershot.global_position)
	scale_component.tween_scale()

