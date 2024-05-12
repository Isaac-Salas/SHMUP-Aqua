extends Node2D
@onready var timer = $RigidBody2D/Timer
@onready var area_2d = $RigidBody2D/Area2D
@onready var rigid_body_2d = $RigidBody2D
@onready var scale_component = $ScaleComponent


# Called when the node enters the scene tree for the first time.
func _ready():
	scale_component.tween_scale()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_2d_body_entered(body):
	if body.name == "All":
		area_2d.queue_free()
		rigid_body_2d.set_deferred("freeze", false)
		timer.start()
		timer.timeout.connect(destroy)
		
func destroy():
	self.queue_free()
