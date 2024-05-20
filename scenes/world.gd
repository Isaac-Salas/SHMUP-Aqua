extends Node2D

@export var EnemyGen : WaveComponent
@export @onready var Play = false
@onready var control = $Control/Control
@onready var player = $Player
@onready var start_timer = $StartTimer
@onready var game_over = false
@onready var intro_songs = $IntroSongs
@onready var fader = $IntroSongs/Fader
@onready var ingame = $Ingame
@onready var secondfader = $Ingame/Secondfader

# Called when the node enters the scene tree for the first time.
func _ready():
	ingame.finished.connect(looping)
	
	if Global.currentsong == null:
		nextone()
	else:
		intro_songs.finished.connect(nextone)
		intro_songs.stream = Global.currentsong
		intro_songs.play(Global.lastplace)
	
	fader.play("Fadein")
	player.tree_exiting.connect(gameover)
	control.animation_player.play("new_animation")
	control.child_order_changed.connect(toggle)
func looping():
	ingame.stream = load("res://assets/Music/Ingame2.mp3")
	ingame.stream.loop = true
	ingame.play()
func nextone():
	intro_songs.stream = load("res://assets/Music/Intro2.mp3")
	intro_songs.stream.loop = true
	intro_songs.play()

func toggle():
	
	match player.shooting:
		true:
			fader.play("Fadeout")
			await fader.animation_finished
			intro_songs.stop()
			ingame.stream = load("res://assets/Music/Ingame1.mp3").duplicate()
			ingame.play()
			start_timer.start(2)
			await start_timer.timeout
			start_timer.queue_free()
			Play = true
	match player.punching:
		true:
			pass
	
	match player.eating:
		true:
			pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_shoot") and game_over == true:
		get_tree().change_scene_to_file("res://scenes/world.tscn")
	
	
	match Play:
		true:
			EnemyGen.starttimer.start()
			Play = false
		false:
			pass

	
func gameover():
	game_over = true
	
