extends Node

# ______________________________________________________________________________

const TILE_SIZE = 128
const LIKE_POINTS = 2
const HATE_POINTS = -1
const POINTS_MULTIPLIER = 100
const VIEW_TRANSITION_TIME_SEC = 0.5
const BOARD_CONTAINER_SIZE = Vector2i(1280, 720)
const EMOTE_DURATION_SEC = 2.5

# ______________________________________________________________________________

enum EntityType {
	GHOST,
	HOLE,
	PROP,
}

enum EntityPartType {
	BASE,
	BOTTOM,
	HEAD,
	FACE,
	MISC
}

# ______________________________________________________________________________

func create_2d_array(dimensions: Vector2i, fill: Variant = null) -> Array[Array]:
	var array: Array[Array] = []
	for x in range(dimensions.x):
		var column = []
		for y in range(dimensions.y):
			column.append(fill) 
		array.append(column)
	return array

# ______________________________________________________________________________

func transition_view(new_view: View) -> void:
	var old_view = State.view
	State.view = new_view
	State.view_container.add_child(new_view)
	new_view.transition_in()
	if (old_view != null): old_view.transition_out()
