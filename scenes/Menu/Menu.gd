extends Control
class_name Menu
@onready var animation_player = $ColorRect/AnimationPlayer
@onready var color_rect = $ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	color_rect.visible = true
	animation_player.play("new_animation")
