extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	EventsBus.connect("temps_jeu", func(tps): text = str(floorf(tps*10)/10.0))

