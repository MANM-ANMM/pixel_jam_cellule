extends Node2D

func avance_vers(depart:float, arrivee:float, temps:float):
	position.x = depart
	$Icon.flip_h = depart > arrivee
	$Icon.play("default")
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(arrivee, position.y), temps)
	tween.tween_callback($Icon.stop)
