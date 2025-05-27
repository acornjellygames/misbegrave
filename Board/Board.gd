extends Node2D

const _Entity = preload("res://Entity/Entity.tscn")

@onready var entities = $Entities

var grid: BoardGrid = null
@onready var relationship_tester: BoardRelationshipTester = BoardRelationshipTester.new()

func _ready() -> void:
	pass
	
func load_level(level: Level) -> void:	
	var new_slots: Array[Array] = []
	for x in range(level.dimensions.x):
		var new_column = []
		for y in range(level.dimensions.y):
			new_column.append(null) # TODO: fill with empty entity
		new_slots.append(new_column)
	
	for level_entity: LevelEntity in level.level_entities:
		var new_entity = _Entity.instantiate()
		entities.add_child(new_entity)
		new_entity.grid_position = level_entity.grid_position
		new_entity.data = level_entity.entity_data
		new_entity.initialize()
		new_slots[level_entity.grid_position.x][level_entity.grid_position.y] = new_entity
		
	var new_grid: BoardGrid = BoardGrid.new()
	new_grid.dimensions = level.dimensions
	new_grid.slots = new_slots
	grid = new_grid

func check_score() -> void:
	pass
