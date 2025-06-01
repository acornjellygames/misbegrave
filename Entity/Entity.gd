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
var surrounding_score: int = 0
var last_position: Vector2 = Vector2.ZERO
var is_hovering: bool = false
var is_dragging: bool = false
var surrounding_entities: Array[Entity] = []
var is_headstone: bool = false

@onready var sprites: Node2D = $Sprites
@onready var debug: Label = $Debug
@onready var emote_container: Node2D = $EmoteContainer
@onready var overhead_text: Label = $OverheadText
@onready var overhead_text_timer: Timer = $OverheadText/OverheadTextTimer

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
	
func move_to_last_position() -> void:
	move_to_position(last_position)

func move_to_grid_position(_grid_position: Vector2i, backup_position: Vector2 = Vector2.ZERO) -> void:
	grid_position = _grid_position
	if (_grid_position == Vector2i(-1, -1)):
		move_to_position(backup_position)
	else:
		move_to_position((Vector2(_grid_position) + Vector2(0.5, 0.5)) * Global.TILE_SIZE)
	_update_debug()

# ______________________________________________________________________________

func set_surrounding_entities(entities: Array[Entity]) -> void:
	surrounding_entities = entities
	calculate_surrounding_entities_score()
	_update_debug()
	
# ______________________________________________________________________________

func render_emote() -> void:
	if (emote_container.get_child_count() != 0):
		for e: Emote in emote_container.get_children():
			e.queue_free()
			
	var emote: Emote = null
	if (surrounding_score > 0):
		emote = Emote.create(preload("res://assets/indicator/love-icon.png"))
	elif (surrounding_score < 0):
		emote = Emote.create(preload("res://assets/indicator/angy-icon.png"))
		
	if (emote != null):
		emote_container.add_child(emote)
		print(emote.position)
		
# ______________________________________________________________________________

func turn_into_headstone() -> void:
	var headstone_texture = Global.HEADSTONES.pick_random()
	for sprite: Sprite2D in sprites.get_children():
		sprite.queue_free()
	var headstone_sprite = Sprite2D.new()
	add_child(headstone_sprite)
	headstone_sprite.set_texture(headstone_texture)
	is_headstone = true
	
# ______________________________________________________________________________

func calculate_surrounding_entities_score() -> void:
	surrounding_score = get_entities_score(surrounding_entities)
	render_emote()
	
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

func get_attribute_pairs_from_surrounding_entities() -> Array[EntityAttributePair]:
	var pairs: Array[EntityAttributePair] = []
	for surrounding_entity: Entity in surrounding_entities:
		pairs.append_array(get_attribute_pairs_from_entity(surrounding_entity))
	return pairs

func get_attribute_pairs_from_entity(target_entity: Entity) -> Array[EntityAttributePair]:
	var pairs: Array[EntityAttributePair] = []
	for target_attribute: EntityAttribute in target_entity.attributes:
		for source_attribute: EntityAttribute in attributes:
			for like_id: String in source_attribute.like_ids:
				if (target_attribute.id == like_id):
					pairs.append(EntityAttributePair.new(self, target_entity, source_attribute.id, target_attribute.id, false))
			for hate_id: String in source_attribute.hate_ids:
				if (target_attribute.id == hate_id):
					pairs.append(EntityAttributePair.new(self, target_entity, source_attribute.id, target_attribute.id, true))
	return pairs
	
# ______________________________________________________________________________

func show_overhead_text(text: String) -> void:
	overhead_text.set_visible(true)
	overhead_text.set_text(text)
	overhead_text_timer.start()

func hide_overhead_text() -> void:
	overhead_text.set_visible(false)
	
func _on_overhead_text_timer_timeout() -> void:
	hide_overhead_text()

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
		var text = title + " = " + str(surrounding_score) + "
		[" + str(grid_position.x) + ", " + str(grid_position.y) + "] / (" + str(position.x) + ", " + str(position.y) + ")
		drag: " + str(is_dragging) + "
		<" + str(last_position.x) + ", " + str(last_position.y) + ">
		S: "
		for s in surrounding_entities:
			text += s.title + ", "
		debug.set_text(text)
	else:
		debug.set_text("[" + str(grid_position.x) + ", " + str(grid_position.y) + "]")
