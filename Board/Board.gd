class_name Board extends Node2D

# ______________________________________________________________________________

signal s_active_ghost_changed(ghost: Entity)
signal s_attribute_pairs_changed(pairs: Array[EntityAttributePair])

# ______________________________________________________________________________

var dimensions: Vector2i = Vector2i(-1, -1)
var prop_grid: Array[Array] = [[]]
var ghost_grid: Array[Array] = [[]]
var active_ghost: Entity = null
var active_hole: Entity = null
var attribute_pairs: Array[EntityAttributePair] = []

@onready var debug = $Debug
@onready var props = $Props
@onready var ghosts = $Ghosts

# ______________________________________________________________________________

func _ready() -> void:
	pass
	
# ______________________________________________________________________________
	
func load_level(level: Level) -> void:	
	_load_props(level)
	_load_ghosts(level)
	dimensions = level.dimensions
	
func _load_props(level: Level) -> void:
	var new_prop_grid: Array[Array] = Global.create_2d_array(level.dimensions)
	for prop: Entity in level.props:
		props.add_child(prop)
		new_prop_grid[prop.grid_position.x][prop.grid_position.y] = prop
		if (prop.type == Global.EntityType.HOLE):
			prop.s_start_hovering.connect(_on_hole_active)
			prop.s_stop_hovering.connect(_on_hole_inactive)
	prop_grid = new_prop_grid

func _load_ghosts(level: Level) -> void:
	var new_ghost_grid: Array[Array] = Global.create_2d_array(level.dimensions)
	ghost_grid = new_ghost_grid
	
	var reserve_bounds = Global.TILE_SIZE * level.dimensions
	for i in range(level.ghosts.size()):
		var ghost = level.ghosts[i]
		ghosts.add_child(ghost)
		var new_position = Vector2(reserve_bounds.x + (Global.TILE_SIZE / 2.0), (i + 0.5) * Global.TILE_SIZE)
		ghost.set_position(new_position)
		ghost.last_position = new_position
		ghost.s_start_dragging.connect(_on_ghost_active)
		ghost.s_stop_dragging.connect(_on_ghost_inactive)
		
# ______________________________________________________________________________

func reset() -> void:
	dimensions = Vector2i(-1, -1)
	prop_grid = [[]]
	ghost_grid = [[]]
	active_ghost = null
	active_hole = null
	attribute_pairs = []
	for node: Node in ghosts.get_children():
		node.queue_free()
	for node: Node in props.get_children():
		node.queue_free()
	
# ______________________________________________________________________________

func refresh_surrounding_entities() -> void:
	for ghost: Entity in ghosts.get_children():
		if (ghost.grid_position == Vector2i(-1, -1)): continue
		var surrounding_entities = get_surrounding_entities(ghost.grid_position)
		ghost.set_surrounding_entities(surrounding_entities)

func get_surrounding_entities(grid_position: Vector2i) -> Array[Entity]:
	var surrounding_entities: Array[Entity] = []
	surrounding_entities.append_array(get_surrounding_entities_from_board(grid_position, prop_grid))
	surrounding_entities.append_array(get_surrounding_entities_from_board(grid_position, ghost_grid))
	return surrounding_entities
		
func get_surrounding_entities_from_board(grid_position: Vector2i, grid: Array[Array]) -> Array[Entity]: # OUGH
	var surrounding_entities: Array[Entity] = []
	if (grid_position.x > 0 && grid_position.y > 0): 
		surrounding_entities.append(grid[grid_position.x - 1][grid_position.y - 1])
	if (grid_position.y > 0): 
		surrounding_entities.append(grid[grid_position.x][grid_position.y - 1])
	if (grid_position.x < dimensions.x - 1 && grid_position.y > 0): 
		surrounding_entities.append(grid[grid_position.x + 1][grid_position.y - 1])
	if (grid_position.x > 0): 
		surrounding_entities.append(grid[grid_position.x - 1][grid_position.y])
	if (grid_position.x < dimensions.x - 1): 
		surrounding_entities.append(grid[grid_position.x + 1][grid_position.y])
	if (grid_position.x > 0 && grid_position.y < dimensions.y - 1): 
		surrounding_entities.append(grid[grid_position.x - 1][grid_position.y + 1])
	if (grid_position.y < dimensions.y - 1): 
		surrounding_entities.append(grid[grid_position.x][grid_position.y + 1])
	if (grid_position.x < dimensions.x - 1 && grid_position.y < dimensions.y - 1): 
		surrounding_entities.append(grid[grid_position.x + 1][grid_position.y + 1])
	surrounding_entities = surrounding_entities.filter(func (e): return e != null)
	return surrounding_entities
		
# ______________________________________________________________________________

func calculate_attribute_pairs() -> void:
	attribute_pairs = []
	for ghost: Entity in ghosts.get_children():
		attribute_pairs.append_array(ghost.get_attribute_pairs_from_surrounding_entities())
	s_attribute_pairs_changed.emit(attribute_pairs)
	
	# DEBUG
	var d = ""
	for a: EntityAttributePair in attribute_pairs:
		if (a.is_negative):
			d += "- "
		else:
			d += "+ "
		d += "{ " + a.source_entity.title + " (" + a.source_attribute_id + ")" + " -> " + a.target_entity.title + " (" + a.target_attribute_id + ")" + " }"
		d += "\n"
	print(d)

# ______________________________________________________________________________

func _on_hole_active(hole: Entity) -> void:
	if (active_hole == null):
		active_hole = hole
		_update_debug()

func _on_hole_inactive(_hole: Entity) -> void:
	active_hole = null
	_update_debug()

func _on_ghost_active(ghost: Entity) -> void:
	active_ghost = ghost
	s_active_ghost_changed.emit(ghost)
	_update_debug()

func _on_ghost_inactive(ghost: Entity) -> void:
	if (active_ghost != null):
		print("ghost: " + ghost.title + " / active_ghost: " + active_ghost.title)
	else:
		print("ghost: " + ghost.title)

	if (active_hole == null || ghost_grid[active_hole.grid_position.x][active_hole.grid_position.y] == active_ghost):
		return active_ghost.move_to_last_position()
	
	var grid_position = active_hole.grid_position
	var blocking_ghost = ghost_grid[grid_position.x][grid_position.y]
	if (blocking_ghost != null):
		blocking_ghost.move_to_grid_position(active_ghost.grid_position, active_ghost.last_position)
		ghost_grid[active_ghost.grid_position.x][active_ghost.grid_position.y] = blocking_ghost
	else:
		ghost_grid[active_ghost.grid_position.x][active_ghost.grid_position.y] = null
	active_ghost.move_to_grid_position(grid_position)
	ghost_grid[grid_position.x][grid_position.y] = active_ghost
	
	active_ghost = null
	s_active_ghost_changed.emit(null)
	refresh_surrounding_entities()
	_update_debug()
	
# ______________________________________________________________________________

func _update_debug() -> void:
	var ghost_title = ""
	var ghost_grid_position = ""
	if (!!active_ghost): 
		ghost_title = active_ghost.title
		ghost_grid_position = "[" + str(active_ghost.grid_position.x) + ", " + str(active_ghost.grid_position.y) + "]"
	var hole_grid_position = ""
	if (!!active_hole): 
		hole_grid_position = "[" + str(active_hole.grid_position.x) + ", " + str(active_hole.grid_position.y) + "]"
	debug.set_text("Ghost: " + ghost_title + " " + ghost_grid_position + "
	" + "Hole: " + hole_grid_position)
