extends Node2D

@export var levels_scenes:Array[PackedScene]
var level:Node2D
var num_level:=0
@onready var zone_gardee:=$ZoneGarde

func _ready():
	EventsBus.connect("level_ended", next_level)
	EventsBus.connect("piece_deplacee", piece_deplacee)
	
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

func piece_deplacee():
	if zone_gardee.get_overlapping_areas().size()>0:
		print("Perdu")
		EventsBus.emit_signal("defaite")
