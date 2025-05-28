class_name Level extends Object

# ______________________________________________________________________________

var id: String
var title: String
var dimensions: Vector2i
var entities: Array[Entity]

# ______________________________________________________________________________

func _init(_id: String, _title: String, _dimensions: Vector2i, _entities: Array[Entity]) -> void:
	id = _id
	title = _title
	dimensions = _dimensions
	entities = _entities
