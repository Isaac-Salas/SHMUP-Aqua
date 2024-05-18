extends Node2D

@onready var enemy = $EnemyTest
@onready var stats_component = %StatsComponent
@onready var move_component = $EnemyTest/MoveComponent
@onready var scale_component = $EnemyTest/ScaleComponent
@onready var shake_component = $EnemyTest/ShakeComponent
@onready var visible_on_screen_notifier_2d = $EnemyTest/VisibleOnScreenNotifier2D
@onready var hurtbox_component = $EnemyTest/HurtboxComponent
@onready var hitbox_component = $EnemyTest/HitboxComponent
@onready var sprite = $EnemyTest/AnimatedSprite2D
@onready var spawner_component = $SpawnerComponent


# Called when the node enters the scene tree for the first time.
func _ready():
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	hurtbox_component.hurt.connect(func(Hitbox : HitboxComponent):
		scale_component.tween_scale()
		shake_component.tween_shake()
		)
	stats_component.no_health.connect(die)
	
	
func die():
	spawner_component.spawn()
	hurtbox_component.queue_free()
	hitbox_component.queue_free()
	sprite.modulate = Color(0.5,0.5,0.5,0.5)
	enemy.collision_layer = 512
	enemy.collision_mask = 512
	enemy.linear_velocity.x = randi_range(300,600)
	enemy.linear_velocity.y = randi_range(-400,400)
	enemy.angular_velocity = 100
	sprite.z_index = -1
	move_component.active = false
	enemy.set_deferred("freeze", false)
