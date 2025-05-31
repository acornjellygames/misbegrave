class_name EntityPart extends Object

# ______________________________________________________________________________

var id: String
var type: Global.EntityPartType
var texture: Texture2D

# ______________________________________________________________________________

func _init(_id: String, _type: Global.EntityPartType, _texture: Texture2D) -> void:
	id = _id
	type = _type
	texture = _texture
