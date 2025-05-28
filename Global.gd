extends Node

# ______________________________________________________________________________

const TILE_SIZE = 96

const LIKE_POINTS = 2
const HATE_POINTS = -1

# ______________________________________________________________________________

enum EntityType {
	GHOST,
	GRAVE,
	SPECIAL
}

enum EntityPartType {
	BASE,
	BOTTOM,
	HEAD,
	FACE
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
