extends Node



var entrees_id := {
	Vector2i(0,0): [Enums.Direction.Haut, Enums.Direction.Gauche],
	Vector2i(1,0): [Enums.Direction.Haut, Enums.Direction.Droite],
	Vector2i(0,1): [Enums.Direction.Bas, Enums.Direction.Gauche],
	Vector2i(1,1): [Enums.Direction.Bas, Enums.Direction.Droite],
	Vector2i(2,0): [Enums.Direction.Gauche],
	Vector2i(2,1): [Enums.Direction.Gauche],
	Vector2i(3,0): [Enums.Direction.Droite],
	Vector2i(3,1): [Enums.Direction.Droite],
}

var couleur_tube_entree_id := {
	Vector2i(3,0) : Enums.CouleurTube.Vert,
	Vector2i(3,1) : Enums.CouleurTube.Rouge,
}

var couleur_tube_sortie_id := {
	Vector2i(2,0) : Enums.CouleurTube.Vert,
	Vector2i(2,1) : Enums.CouleurTube.Rouge,
}
