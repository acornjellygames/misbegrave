class_name Entity extends Node2D

# ______________________________________________________________________________

var title: String
var attributes: Array[EntityAttribute]
var parts: Array[EntityPart]
var grid_position: Vector2i

@onready var sprites = $Sprites
@onready var debug = $Debug

# ______________________________________________________________________________

static var EntityScene = load("res://Entity/Entity.tscn")

static func create(_title: String, _attributes: Array[EntityAttribute], _parts: Array[EntityPart], _grid_position: Vector2i = Vector2i(-1, -1)) -> Entity:
	var entity = EntityScene.instantiate()
	entity.title = _title
	entity.attributes = _attributes
	entity.parts = _parts
	entity.grid_position = _grid_position
	return entity
	
# ______________________________________________________________________________

func _ready() -> void:
	if (grid_position != Vector2i(-1, -1)):
		set_position(grid_position * Global.TILE_SIZE)
	debug.set_text("[" + str(grid_position.x) + ", " + str(grid_position.y) + "]\n(" + str(position.x) + ", " + str(grid_position.y) + ")")
	render()
	
# ______________________________________________________________________________

func render() -> void:
	for part: EntityPart in parts:
		var sprite = Sprite2D.new()
		sprites.add_child(sprite)
		sprite.set_texture(part.texture)
		
# ______________________________________________________________________________
	
func move(_grid_position: Vector2i) -> void:
	self.grid_position = _grid_position

# ______________________________________________________________________________
	
func get_surrounding_score(board: Board) -> int:
	var surrounding_entities: Array[Entity] = get_surrounding_entities(board)
	return get_entities_score(surrounding_entities)
	
func get_surrounding_entities(board: Board) -> Array[Entity]: # OUGH
	var surrounding_entities: Array[Entity] = []
	if (grid_position.x > 0 && grid_position.y > 0): 
		surrounding_entities.append(board.grid[grid_position.x - 1][grid_position.y - 1])
	if (grid_position.y > 0): 
		surrounding_entities.append(board.grid[grid_position.x][grid_position.y - 1])
	if (grid_position.x < board.dimensions.x - 1 && grid_position.y > 0): 
		surrounding_entities.append(board.grid[grid_position.x + 1][grid_position.y - 1])
	if (grid_position.x > 0): 
		surrounding_entities.append(board.grid[grid_position.x - 1][grid_position.y])
	if (grid_position.x < board.dimensions.x - 1): 
		surrounding_entities.append(board.grid[grid_position.x + 1][grid_position.y])
	if (grid_position.x > 0 && grid_position.y < board.dimensions.y - 1): 
		surrounding_entities.append(board.grid[grid_position.x - 1][grid_position.y + 1])
	if (grid_position.y < board.dimensions.y - 1): 
		surrounding_entities.append(board.grid[grid_position.x][grid_position.y + 1])
	if (grid_position.x < board.dimensions.x - 1 && grid_position.y < board.dimensions.y - 1): 
		surrounding_entities.append(board.grid[grid_position.x + 1][grid_position.y + 1])
	return surrounding_entities
	
# ______________________________________________________________________________
	
func get_entities_score(entities: Array[Entity]) -> int:
	var score: int = 0
	for entity: Entity in entities:
		score += get_entity_score(entity)
	return score
	
func get_entity_score(entity: Entity) -> int:
	return _get_attributes_score(entity.attributes)
	
# ______________________________________________________________________________
	
func _get_attributes_score(target_attributes: Array[EntityAttribute]) -> int:
	var score: int = 0
	for target_attribute: EntityAttribute in target_attributes:
		score += _get_attribute_score(target_attribute)
	return score

func _get_attribute_score(target_attribute: EntityAttribute) -> int:
	var score: int = 0
	for attribute: EntityAttribute in attributes:
		score += attribute.get_attribute_score(target_attribute)
	return score
