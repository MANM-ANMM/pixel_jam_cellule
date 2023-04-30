extends Control


@export var retour_button : Button

func _ready():
	retour_button.connect("pressed", func(): EventsBus.emit_signal("menu_go_to_main"))
