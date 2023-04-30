extends Control

@export var jouer_button : Button
@export var credit_button : Button
@export var quitter_button : Button
@export var selection_button : Button

# Called when the node enters the scene tree for the first time.
func _ready():
	jouer_button.connect("pressed", func(): EventsBus.emit_signal("menu_start_game"))
	quitter_button.connect("pressed", func(): EventsBus.emit_signal("menu_quit_game"))
	selection_button.connect("pressed", func(): EventsBus.emit_signal("menu_go_to_selection"))
