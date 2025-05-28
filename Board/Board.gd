class_name Board extends Node2D

# ______________________________________________________________________________

var grid: Array[Array]
var reserve: Array[Entity]
var dimensions: Vector2i

@onready var entities = $Entities

# ______________________________________________________________________________

func _ready() -> void:
	pass
	
func load_level(level: Level) -> void:	
	var new_grid: Array[Array] = Global.create_2d_array(level.dimensions)
	for entity: Entity in level.entities:
		entities.add_child(entity)
		if (entity.grid_position == Vector2i(-1, -1)):
			reserve.append(entity)
		else:
			new_grid[entity.grid_position.x][entity.grid_position.y] = entity
	grid = new_grid
	dimensions = level.dimensions
