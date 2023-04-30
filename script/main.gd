extends Node2D

@export var levels_scenes:Array[PackedScene]
var level:Node2D
var num_level:=0

func _ready():
	EventsBus.connect("level_ended", next_level)
	
	start_level()

func start_level():
	if num_level >= levels_scenes.size():
		print("Dernier niveau")
		return
	
	unload_level()
	level = levels_scenes[num_level].instantiate()

	add_child(level)
	level.position = $SpawnPuzzle.position


func next_level():
	num_level+=1
	start_level()


func unload_level():
	if not level:
		return
	
	level.queue_free()


func _on_timer_gardien_timeout():
	$gardien.avance_vers(-200, 171, 3.0)
	
	
