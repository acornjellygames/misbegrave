class_name Level extends Object

# ______________________________________________________________________________

var id: String
var title: String
var dimensions: Vector2i
var max_score: int
var props: Array[Entity]
var ghosts: Array[Entity]

# ______________________________________________________________________________

func _init(_id: String, _title: String, _dimensions: Vector2i, _max_score: int, _props: Array[Entity] = [], _ghosts: Array[Entity] = []) -> void:
	id = _id
	title = _title
	dimensions = _dimensions
	max_score = _max_score
	props = _props
	ghosts = _ghosts
