extends Node2D
@onready var loop = $Loop
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
				loop.queue_free()
				animation_player.play("RESET")
			
