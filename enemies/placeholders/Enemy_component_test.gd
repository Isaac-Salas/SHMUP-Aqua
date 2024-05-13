class_name EnemyComponent
extends RigidBody2D

@onready var stats_component = $"../StatsComponent"



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	print(area.name)
	if area.name == "ShotHit":
		collision_layer = 0
		collision_mask = 512
		linear_velocity.x = randi_range(300,600)
		linear_velocity.y = randi_range(-400,400)
		angular_velocity = 100
		set_deferred("freeze", false)


