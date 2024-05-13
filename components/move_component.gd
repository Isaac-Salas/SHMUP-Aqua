class_name MoveComponent
extends Node
@export var actor : Node2D
@export var velocity : Vector2
@export var active = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match active:
		true:
			actor.translate(velocity*delta)
		false:
			pass
	
