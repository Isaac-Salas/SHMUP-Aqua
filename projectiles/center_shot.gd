extends Node2D
@onready var center_shot = $CenterShot
@onready var timer = $CenterShot/Timer
@onready var sprite_2d = $CenterShot/Sprite2D
@onready var area_2d = $CenterShot/ShotHit
@onready var scale_component = $ScaleComponent
@onready var collision_shape_2d = $CenterShot/CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	scale_component.tween_scale()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_2d_body_entered(body):
	#print(body.name)
	if body.name == "All" or body.name == "EnemyTest" or body.name == "All2":
		area_2d.queue_free()
		collision_shape_2d.disabled = false
		center_shot.set_deferred("freeze", false)
		#timer.start()
		#timer.timeout.connect(destroy)
		sprite_2d.modulate = Color(0.5,0.5,0.5,1)
		
func destroy():
	self.queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	destroy()
