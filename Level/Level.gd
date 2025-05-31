class_name Level extends Object

# ______________________________________________________________________________

var id: String
var title: String
var dimensions: Vector2i
var props: Array[Entity]
var ghosts: Array[Entity]

# ______________________________________________________________________________

func _init(_id: String, _title: String, _dimensions: Vector2i, _props: Array[Entity] = [], _ghosts: Array[Entity] = []) -> void:
	id = _id
	title = _title
	dimensions = _dimensions
	props = _props
	ghosts = _ghosts
