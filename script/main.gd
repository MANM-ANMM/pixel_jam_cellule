extends Node2D
class_name MainGame

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
		level.defaite = true
		
		
		var tween = get_tree().create_tween()
		tween.tween_callback(func() : EventsBus.emit_signal("vu_par_le_garde"))		
		tween.tween_interval(3)
		tween.tween_callback(func() : EventsBus.emit_signal("defaite"))
