extends View

# ______________________________________________________________________________

@export var board: Board
@export var board_container: Container
@export var ghost_name: Label
@export var ghost_attributes: Label

# ______________________________________________________________________________

func _ready() -> void:
	load_level(Levels.TEST)
	
# ______________________________________________________________________________
	
func load_level(level: Level) -> void:
	var level_size: Vector2 = (level.dimensions + Vector2i(1, 0)) * Global.TILE_SIZE
	var interstitial_size = Vector2(Global.BOARD_CONTAINER_SIZE) - level_size
	board.set_position(interstitial_size / 2)
	board.load_level(level)

# ______________________________________________________________________________

func _on_active_ghost_changed(ghost: Entity) -> void:
	if (ghost == null):
		ghost_name.set_text("")
		ghost_attributes.set_text("")
		return
	
	var ghost_attributes_text: String = ""
	for attribute: EntityAttribute in ghost.attributes:
		ghost_attributes_text += attribute.title + "\n"
	
	ghost_attributes.set_text(ghost_attributes_text)
	ghost_name.set_text(ghost.title)
	
	
