extends View

# ______________________________________________________________________________

@export var board: Board
@export var level_label: Label

@export var info: Control
@export var ghost_name_label: Label
@export var ghost_attributes_label: Label

@export var scoring: Control
@export var pair_label: Label
@export var adding_to_score_label: Label
@export var score_label: Label
@export var scoring_timer: Timer
@export var primary_button: PrimaryButton

@export var decos: Node

@export var sfx_player: AudioStreamPlayer

var is_scoring: bool = false

# ______________________________________________________________________________

func _ready() -> void:
	Global.play_bgm(Global.BGM.THEME_LIGHT)
	reset()
	load_level(Levels.order.front().call())
	
# ______________________________________________________________________________
	
func load_level(level: Level) -> void:
	var level_size: Vector2 = (level.dimensions) * Global.TILE_SIZE
	var interstitial_size = Vector2(Global.BOARD_CONTAINER_SIZE) - level_size
	board.set_position(interstitial_size / 2)
	board.load_level(level)
	level_label.set_text(level.title)
	generate_decos()
	
# ______________________________________________________________________________

func reset() -> void:
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
	for deco: Sprite2D in decos.get_children():
		deco.queue_free()

# ______________________________________________________________________________
	
func generate_decos() -> void:
	var deco_count = int(Global.rng.randi_range(Global.DECO_COUNT_MIN, Global.DECO_COUNT_MAX))
	for i in range(deco_count):
		var deco_position: Vector2 = Vector2(Global.rng.randf_range(0, 1920), Global.rng.randf_range(0, 1080))
		var deco_variant = Global.rng.randi_range(0, Global.DECOS.size() - 1)
		var deco_transparency = Global.rng.randf_range(0, 0.333)
		var deco = Sprite2D.new()
		var is_mirrored = Global.rng.randf() > 0.5
		decos.add_child(deco)
		deco.set_global_position(deco_position)
		deco.set_self_modulate(Color(1, 1, 1, deco_transparency))
		if (is_mirrored): deco.set_scale(Vector2(-1, 1))
		deco.set_texture(Global.DECOS[deco_variant])
	
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
		play_sfx(Global.SFX.DING_NEGATIVE)
	else:
		add_points *= Global.LIKE_POINTS
		play_sfx(Global.SFX.DING_POSITIVE)
	var adding_to_score_text = adding_to_score_sign + str(add_points)
	adding_to_score_label.set_text(adding_to_score_text)
	
	State.score += add_points
	score_label.set_text(str(State.score))
	
	pair.source_entity.show_overhead_text(adding_to_score_text)
	
	if (State.pairs.size() == 0 || pair.source_entity != State.pairs.back().source_entity):
		pair.source_entity.turn_into_headstone()
		var hole_under_ghost = board.prop_grid[pair.source_entity.grid_position.x][pair.source_entity.grid_position.y]
		if (hole_under_ghost): hole_under_ghost.set_visible(false)
	
	scoring_timer.start()
	
func finish_scoring() -> void:
	for ghost: Entity in board.ghosts.get_children():
		if (!ghost.is_headstone):
			ghost.turn_into_headstone()
			var hole_under_ghost = board.prop_grid[ghost.grid_position.x][ghost.grid_position.y]
			if (hole_under_ghost): hole_under_ghost.set_visible(false)
	
	scoring_timer.stop()
	State.total_score += State.score
	pair_label.set_text("Congrats!")
	adding_to_score_label.set_text("Final Score")
	primary_button.set_text("Next Level")
	play_sfx(Global.SFX.DING_FINAL)
	
func _on_scoring_timer_timeout() -> void:
	if (State.pairs.size() > 0):
		start_scoring()
	else:
		finish_scoring()
		
# ______________________________________________________________________________

func play_sfx(stream: AudioStream) -> void:
	sfx_player.stop()
	if (sfx_player.get_stream() == stream):
		sfx_player.set_pitch_scale(sfx_player.get_pitch_scale() + 0.1)
	else:
		sfx_player.set_pitch_scale(1)
	sfx_player.set_stream(stream)
	
	sfx_player.play()
	
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
	var new_level = Levels.order[new_level_index].call()
	State.level_index = new_level_index
	State.level = new_level
	load_level(new_level)
	
func _on_primary_button_pressed() -> void:
	if (is_scoring):
		next_level()
	else:
		lock_in()
