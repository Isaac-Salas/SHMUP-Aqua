extends Node2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer




func _on_timer_timeout():
	animation_player.play("AppearText")
