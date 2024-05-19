extends Node2D
class_name EnemyWave
var Ecount = 0
signal waveend()
@onready var emitonce = true

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in self.get_children ():
		Ecount += 1
	print(Ecount)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#print(get_children())
	if get_children() == []:
		match emitonce:
			true:
				waveend.emit()
				emitonce = false
			false:pass
		#print("Yes")
		
	
	
