extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var canstart = false
@onready var timer = $Timer
@onready var aguarriba = $Aguarriba
@onready var prota = $Prota
@onready var globo = $Prota/Globo
@onready var barquito = $Barquito
@onready var fondo = $Fondo
@onready var label = $Label
@onready var animation = ""


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
				prota.animation_finished.connect(switching)
				label.queue_free()
				await prota.animation_looped
				prota.play("new_animation")
				globo.visible = true
				globo.play("Dialogo")
				animation = "Chapuzon"
				canstart = false
				
				
			

func switching():
	prota.offset.x = 20
	prota.offset.y = -12
	prota.play(animation)
	await prota.animation_finished
	queue_free()
	
	
