class_name BoardRelationshipTester extends Object

func is_satisfied_relationship(grid: BoardGrid, entity: Entity, relationship: EntityRelationship) -> bool:
	var potential_grid_positions = _get_potential_grid_positions(grid, entity.grid_position, relationship)
	var potential_entities = _get_entities_from_grid_positions(grid, potential_grid_positions)
	var is_entity_containing_attributes = _is_entity_containing_attributes(entity, relationship.attributes, relationship.is_all_required)
	if (relationship.is_negative == true):
		return !is_entity_containing_attributes
	else:
		return is_entity_containing_attributes

func _get_potential_grid_positions(grid: BoardGrid, grid_position: Vector2i, relationship: EntityRelationship) -> Array[Vector2i]:
	var positions_to_check: Array[Vector2i] = []
	
	if (relationship.type == Global.EntityRelationshipType.ADJACENT):
		positions_to_check.append_array([
			Vector2i(grid_position.x - 1, grid_position.y - 1),
			Vector2i(grid_position.x, grid_position.y - 1),
			Vector2i(grid_position.x + 1, grid_position.y - 1),
			Vector2i(grid_position.x - 1, grid_position.y),
			Vector2i(grid_position.x + 1, grid_position.y),
			Vector2i(grid_position.x - 1, grid_position.y + 1),
			Vector2i(grid_position.x, grid_position.y + 1),
			Vector2i(grid_position.x + 1, grid_position.y + 1)
		])
	
	elif (relationship.type == Global.EntityRelationshipType.SAME_ROW_OR_COLUMN):
		for x in range(0, grid.dimensions.x):
			if (x != grid_position.x): 
				positions_to_check.append(Vector2i(x, grid_position.y))
		for y in range(0, grid.dimensions.y):
			if (y != grid_position.y): 
				positions_to_check.append(Vector2i(grid_position.x, y))
		
	elif (relationship.type == Global.EntityRelationshipType.SAME_ROW):
		for x in range(0, grid.dimensions.x):
			if (x != grid_position.x): 
				positions_to_check.append(Vector2i(x, grid_position.y))
	
	elif (relationship.type == Global.EntityRelationshipType.SAME_COLUMN):
		for y in range(0, grid.dimensions.y):
			if (y != grid_position.y): 
				positions_to_check.append(Vector2i(grid_position.x, y))
	
	return positions_to_check
	
func _get_entities_from_grid_positions(grid: BoardGrid, grid_positions: Array[Vector2i]) -> Array[Entity]:
	var entities: Array[Entity] = []
	for grid_position: Vector2i in grid_positions:
		if (grid_position.x < 0 || grid_position.x >= grid.dimensions.x || grid_position.y < 0 || grid_position.y >= grid.dimensions.y): 
			continue
		else:
			entities.append(grid.slots[grid_position.x][grid_position.y])
	
	return entities
	
func _is_entity_containing_attributes(entity: Entity, attributes: Array[EntityAttribute], is_all_required: bool) -> bool:
	if (is_all_required):
		for attribute: EntityAttribute in attributes:
			var is_attribute_found = false
			for entity_attribute: EntityAttribute in entity.attributes:
				if (entity_attribute.id == attribute.id): 
					is_attribute_found = true
					break
			if (is_attribute_found == false):
				return false
		return true
		
	else:
		for attribute: EntityAttribute in attributes:
			for entity_attribute: EntityAttribute in entity.attributes:
				if (entity_attribute.id == attribute.id): 
					return true
		return false
