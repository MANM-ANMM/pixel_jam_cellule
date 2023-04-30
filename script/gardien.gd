extends Node2D

@export var points_arrets:Array[Marker2D]
@export var points_extremes:Array[Marker2D]

@onready var timer := $Timer

func _ready():
	timer.start(randf_range(10, 20))

func avance_vers(depart:float, arrivee:float, temps:float):
	position.x = depart
	$Icon.flip_h = depart > arrivee
	$Icon.play("default")
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(arrivee, position.y), temps)
	tween.tween_callback($Icon.stop)


func _on_timer_timeout():
	var tween = get_tree().create_tween()
	var deb : Vector2 = points_extremes.pick_random().position
	var arrivee : Vector2 = points_extremes.pick_random().position
	var arret : Vector2 = points_arrets.pick_random().position
	
