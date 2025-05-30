extends View

# ______________________________________________________________________________

@export var board: Board
@export var board_container: Container

func _ready() -> void:
	load_level(Levels.TEST)
	
func load_level(level: Level) -> void:
	var level_size: Vector2 = (level.dimensions + Vector2i(1, 0)) * Global.TILE_SIZE
	var interstitial_size = Vector2(Global.BOARD_CONTAINER_SIZE) - level_size
	board.set_position(interstitial_size / 2)
	board.load_level(level)
