extends View

# ______________________________________________________________________________

@export var board: Board
@export var board_container: Container

@export var info: Control
@export var ghost_name_label: Label
@export var ghost_attributes_label: Label

@export var scoring: Control
@export var pair_label: Label
@export var adding_to_score_label: Label
@export var score_label: Label
@export var scoring_timer: Timer

@export var primary_button: PrimaryButton

var is_scoring: bool = false

# ______________________________________________________________________________

func _ready() -> void:
	reset()
	load_level(Levels.order.front())
	
# ______________________________________________________________________________
	
func load_level(level: Level) -> void:
	var level_size: Vector2 = (level.dimensions + Vector2i(1, 0)) * Global.TILE_SIZE
	var interstitial_size = Vector2(Global.BOARD_CONTAINER_SIZE) - level_size
	board.set_position(interstitial_size / 2)
	board.load_level(level)
	
# ______________________________________________________________________________

func reset() -> void:
	board.reset()
	is_scoring = false
	State.score = 0
	State.pairs = []
	primary_button.set_text("Lay to Rest")
	pair_label.set_text("")
	adding_to_score_label.set_text("")
	score_label.set_text("")
	ghost_name_label.set_text("")
	ghost_attributes_label.set_text("")
	info.set_visible(true)
	scoring.set_visible(false)
	
# ______________________________________________________________________________

func start_scoring() -> void:
	if (State.pairs.size() <= 0): return finish_scoring()
	var pair: EntityAttributePair = State.pairs.pop_back()
	var source_attribute: EntityAttribute = EntityAttributes[pair.source_attribute_id]
	var target_attribute: EntityAttribute = EntityAttributes[pair.target_attribute_id]
	pair_label.set_text(source_attribute.title + "\n+\n" + target_attribute.title)
	
	var add_points = Global.POINTS_MULTIPLIER
	var adding_to_score_sign: String = "+"
	if (pair.is_negative):
		adding_to_score_sign = ""
		add_points *= Global.HATE_POINTS
	else:
		add_points *= Global.LIKE_POINTS
	var adding_to_score_text = adding_to_score_sign + str(add_points)
	adding_to_score_label.set_text(adding_to_score_text)
	
	State.score += add_points
	score_label.set_text(str(State.score))
	
	pair.source_entity.show_overhead_text(adding_to_score_text)
	scoring_timer.start()
	
func finish_scoring() -> void:
	State.total_score += State.score
	pair_label.set_text("Congrats!")
	adding_to_score_label.set_text("Final Score")
	primary_button.set_text("Next Level")
	
func _on_scoring_timer_timeout() -> void:
	if (State.pairs.size() > 0):
		start_scoring()
	else:
		finish_scoring()

# ______________________________________________________________________________

func _on_active_ghost_changed(ghost: Entity) -> void:
	if (ghost == null):
		ghost_name_label.set_text("")
		ghost_attributes_label.set_text("")
		return
	
	var ghost_attributes_text: String = ""
	for attribute: EntityAttribute in ghost.attributes:
		ghost_attributes_text += attribute.title + "\n"
	
	ghost_attributes_label.set_text(ghost_attributes_text)
	ghost_name_label.set_text(ghost.title)

# ______________________________________________________________________________

func _on_attribute_pairs_changed(pairs: Array[EntityAttributePair]) -> void:
	info.set_visible(false)
	scoring.set_visible(true)
	pairs.reverse()
	State.pairs = pairs
	start_scoring()

# ______________________________________________________________________________

func lock_in() -> void:
	is_scoring = true
	board.calculate_attribute_pairs()
	
func next_level() -> void:
	var new_level_index = State.level_index + 1 
	if (new_level_index >= Levels.order.size()):
		return Global.transition_view(Views.END.instantiate())	
	
	reset()
	var new_level = Levels.order[new_level_index]
	State.level_index = new_level_index
	State.level = new_level
	board.load_level(new_level)
	
func _on_primary_button_pressed() -> void:
	if (is_scoring):
		next_level()
	else:
		lock_in()
