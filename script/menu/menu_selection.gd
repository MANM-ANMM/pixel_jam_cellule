extends Control

@export var a_select : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	EventsBus.emit_signal("give_me_level_count", gen_levels)
	gen_levels(5)

func gen_levels(nb:int):
	for i in range(nb):
		var l = a_select.instantiate()
		l.text = str(i+1)
		l.connect("pressed", func(): EventsBus.emit_signal("start_level", i))
		$HBox.add_child(l)


func _on_retour_pressed():
	EventsBus.emit_signal("menu_go_to_main")
