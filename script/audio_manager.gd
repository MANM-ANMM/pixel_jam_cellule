extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	EventsBus.connect("piece_deplacee", piece_deplacee)
	EventsBus.connect("vu_par_le_garde", garde_mecontent)
	pass # Replace with function body.

func piece_deplacee():
	print("son")
	if randi_range(0, 1):
		$DeplacementPiece1.play()
	else:
		$DeplacementPiece2.play()

func garde_mecontent():
	$Garde.play()
