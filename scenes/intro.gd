extends Node2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer
@onready var canstart = false
@onready var timer = $Timer



func _on_timer_timeout():
	animation_player.play("AppearText")
	timer.autostart = false
	canstart = true

func _input(event):
	if Input.is_anything_pressed():
		match canstart:
			false:
				pass
			true:
				animation_player.play("RESET")
			
