extends Node2D

@export var levels_scenes:Array[PackedScene]
var level

func _ready():
	level = levels_scenes.front().instantiate()

	add_child(level)
