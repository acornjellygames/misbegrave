class_name EntityAttribute extends Object

# ______________________________________________________________________________

var id: String
var title: String
var description: String
var like_ids: Array[String]
var hate_ids: Array[String]

# ______________________________________________________________________________

func _init(_id: String, _title: String, _description: String, _like_ids: Array[String], _hate_ids: Array[String]) -> void:
	id = _id
	title = _title
	description = _description
	like_ids = _like_ids
	hate_ids = _hate_ids
	
# ______________________________________________________________________________

func get_attribute_score(target_attribute: EntityAttribute) -> int:
	var score: int = 0
	for like_id: String in like_ids:
		if (like_id == target_attribute.id):
			score += Global.LIKE_POINTS
	for hate_id: String in hate_ids:
		if (hate_id == target_attribute.id):
			score += Global.HATE_POINTS
	return score
	
