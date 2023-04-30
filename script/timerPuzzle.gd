extends Node

var temps:float=-1

func _ready():
	EventsBus.connect("menu_start_game", start_timer)
	EventsBus.connect("defaite", end_timer)
	EventsBus.connect("victoire", end_timer)

func _process(delta):
	if temps >=0:
		temps += delta
		EventsBus.emit_signal("temps_jeu", temps)

func start_timer():
	temps = 0
	
func end_timer():
	temps = -1
