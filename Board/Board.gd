class_name Board extends Node2D

# ______________________________________________________________________________

var dimensions: Vector2i = Vector2i(-1, -1)
var prop_grid: Array[Array] = [[]]
var ghost_grid: Array[Array] = [[]]
var active_ghost: Entity = null
var active_hole: Entity = null

@onready var debug = $Debug
@onready var props = $Props
@onready var ghosts = $Ghosts

# ______________________________________________________________________________

func _ready() -> void:
	pass
	
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
		ghosts.add_child(level.ghosts[i])
		level.ghosts[i].set_position(Vector2(reserve_bounds.x + (Global.TILE_SIZE / 2.0), (i + 0.5) * Global.TILE_SIZE))
		level.ghosts[i].s_start_dragging.connect(_on_ghost_active)
		level.ghosts[i].s_stop_dragging.connect(_on_ghost_inactive)
		
# ______________________________________________________________________________

func _on_hole_active(hole: Entity) -> void:
	if (active_hole == null):
		active_hole = hole
		_update_debug()

func _on_hole_inactive(_hole: Entity) -> void:
	active_hole = null
	_update_debug()

func _on_ghost_active(ghost: Entity) -> void:
	if (active_ghost == null):
		active_ghost = ghost
		_update_debug()

func _on_ghost_inactive(ghost: Entity) -> void:
	if (active_hole != null && active_ghost != null):
		ghost_grid[active_hole.grid_position.x][active_hole.grid_position.y] = ghost
		active_ghost.move(active_hole.grid_position)
	active_ghost = null
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
