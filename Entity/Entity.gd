class_name Entity extends Node2D

# ______________________________________________________________________________

signal s_start_hovering(entity: Entity)
signal s_stop_hovering(entity: Entity)
signal s_start_dragging(entity: Entity)
signal s_stop_dragging(entity: Entity)

# ______________________________________________________________________________

var title: String
var type: Global.EntityType
var attributes: Array[EntityAttribute]
var parts: Array[EntityPart]
var grid_position: Vector2i

var parent: Node = null
var last_position: Vector2 = Vector2.ZERO
var is_hovering: bool = false
var is_dragging: bool = false

@onready var sprites = $Sprites
@onready var debug = $Debug

# ______________________________________________________________________________

static var EntityScene = load("res://Entity/Entity.tscn")

static func create(_title: String, _type: Global.EntityType, _attributes: Array[EntityAttribute], _parts: Array[EntityPart], _grid_position: Vector2i = Vector2i(-1, -1)) -> Entity:
	var entity = EntityScene.instantiate()
	entity.title = _title
	entity.type = _type
	entity.attributes = _attributes
	entity.parts = _parts
	entity.grid_position = _grid_position
	return entity
	
# ______________________________________________________________________________

func _ready() -> void:
	parent = get_parent()
	if (grid_position != Vector2i(-1, -1)):
		move_to_grid_position(grid_position)
	render()
	
func _input(event: InputEvent) -> void:
	if (type != Global.EntityType.GHOST): 
		return
		
	if (event is InputEventMouseButton):
		if (event.is_pressed() && is_hovering):
			is_dragging = true
			s_start_dragging.emit(self)
			last_position = get_position()
			_update_debug()
		elif (event.is_released() && is_dragging):
			is_dragging = false
			s_stop_dragging.emit(self)
			print("Stop Drag: " + title)
			_update_debug()
			
	if (event is InputEventMouseMotion):
		if (is_dragging):
			var new_position = get_global_mouse_position() - parent.get_global_position()
			set_position(new_position)
			_update_debug()

# ______________________________________________________________________________

func render() -> void:
	for part: EntityPart in parts:
		var sprite = Sprite2D.new()
		sprites.add_child(sprite)
		sprite.set_texture(part.texture)
		
# ______________________________________________________________________________

func move_to_position(_position: Vector2) -> void:
	set_position(_position)
	last_position = _position
	_update_debug()

func move_to_grid_position(_grid_position: Vector2i, backup_position: Vector2 = Vector2.ZERO) -> void:
	grid_position = _grid_position
	if (_grid_position == Vector2i(-1, -1)):
		move_to_position(backup_position)
	else:
		move_to_position((Vector2(_grid_position) + Vector2(0.5, 0.5)) * Global.TILE_SIZE)
	_update_debug()

func move_to_last_position() -> void:
	move_to_position(last_position)
	
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

# ______________________________________________________________________________

func _on_interaction_area_mouse_entered() -> void:
	is_hovering = true
	s_start_hovering.emit(self)
	debug.set_visible(true)
	_update_debug()

func _on_interaction_area_mouse_exited() -> void:
	is_hovering = false
	s_stop_hovering.emit(self)
	debug.set_visible(false)
	_update_debug()

# ______________________________________________________________________________

func _update_debug() -> void:
	if (type == Global.EntityType.GHOST):
		debug.set_text(title + "
		[" + str(grid_position.x) + ", " + str(grid_position.y) + "] / (" + str(position.x) + ", " + str(position.y) + ")
		drag: " + str(is_dragging) + "
		<" + str(last_position.x) + ", " + str(last_position.y) + ">")
	else:
		debug.set_text("[" + str(grid_position.x) + ", " + str(grid_position.y) + "]")
