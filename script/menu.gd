extends CanvasLayer

@export var menu_principal : PackedScene
@export var menu_credit : PackedScene
@export var main_jeu : PackedScene
@export var menu_defaite : PackedScene
@export var menu_selection : PackedScene

var scene_actuelle : Node

func _ready():
	EventsBus.connect("menu_go_to_main", go_to_main)
	EventsBus.connect("defaite", go_to_defaite)
	EventsBus.connect("menu_go_to_credit", go_to_credit)
	EventsBus.connect("menu_go_to_selection", go_to_selection)
	EventsBus.connect("menu_start_game", start_game)
	EventsBus.connect("menu_quit_game", quit_game)
	EventsBus.connect("start_level", start_specific_level)
	go_to_main()

func decharger_menu():
	if not scene_actuelle:
		return
	
	scene_actuelle.queue_free()

func charger_menu(scn:PackedScene):
	if not scn:
		print("Scene de menu manquante")
		return
	decharger_menu()
	scene_actuelle = scn.instantiate()
	add_child(scene_actuelle)

func go_to_main():
	charger_menu(menu_principal)
	
func go_to_defaite():
	charger_menu(menu_defaite)

func go_to_credit():
	charger_menu(menu_credit)

func go_to_selection():
	charger_menu(menu_selection)

func start_game():
	charger_menu(main_jeu)

func start_specific_level(rang:int):
	start_game()
	if scene_actuelle is MainGame:
		scene_actuelle.num_level = rang
		scene_actuelle.start_level()

func quit_game():
	get_tree().quit()
