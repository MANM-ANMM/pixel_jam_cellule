extends Node2D

@export var points_arrets:Array[NodePath]
@export var points_extremes:Array[NodePath]

@onready var timer := $Timer
@onready var sprite := $Icon
@onready var audio_player := $AudioStreamPlayer2D

func _ready():
	timer.start(randf_range(5, 15))

func avance_vers(depart:float, arrivee:float, temps:float):
	position.x = depart
	sprite.flip_h = depart > arrivee
	sprite.play("default")
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(arrivee, position.y), temps)
	tween.tween_callback(sprite.stop)


func _on_timer_timeout():
	var tween = get_tree().create_tween()
	var deb : Vector2 = get_node(points_extremes.pick_random()).position
	var arrivee : Vector2 = get_node(points_extremes.pick_random()).position
	var arret : Vector2 = get_node(points_arrets.pick_random()).position
	
	position = deb
	sprite.flip_h = deb.x > arret.x
	sprite.play("default")
	audio_player.play()
	tween.tween_property(self, "position", arret, randf_range(2.0, 10.0))
	tween.tween_callback(sprite.stop)
	tween.tween_callback(audio_player.stop)
	tween.tween_interval(randf_range(1.0, 3.0))
	tween.tween_callback(audio_player.play)
	tween.tween_callback(func():sprite.play("default"))
	tween.tween_callback(func():sprite.flip_h = arret.x > arrivee.x)
	tween.tween_property(self, "position", arrivee, 5.0)
	tween.tween_callback(audio_player.stop)
	tween.tween_callback(sprite.stop)

	tween.tween_callback(func():timer.start(randf_range(5, 15.0)))
