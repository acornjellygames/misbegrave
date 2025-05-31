class_name EntityAttributePair extends Object

# ______________________________________________________________________________

var source_entity: Entity
var target_entity: Entity
var source_attribute_id: String
var target_attribute_id: String
var is_negative: bool

# ______________________________________________________________________________

func _init(_source_entity: Entity, _target_entity: Entity, _source_attribute_id: String, _target_attribute_id: String, _is_negative: bool = false) -> void:
	source_entity = _source_entity
	target_entity = _target_entity
	source_attribute_id = _source_attribute_id
	target_attribute_id = _target_attribute_id
	is_negative = _is_negative
