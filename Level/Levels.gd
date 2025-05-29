extends Node

# ______________________________________________________________________________

func hole(x: int, y: int) -> Entity:
	return Entity.create("Hole", Global.EntityType.HOLE, [EntityAttributes.HOLE], [EntityParts.HOLE], Vector2i(x, y))

# ______________________________________________________________________________

var TEST = Level.new("TEST", "Test Level", Vector2i(6, 6), 
	[
		hole(0, 0),
		hole(5, 3),
		hole(1, 5),
	],[
		Entity.create("Alice", Global.EntityType.GHOST,
			[ EntityAttributes.SENSITIVE_NOSE ],
			[ EntityParts.BASE_COMMON, EntityParts.BOTTOM_BLOBBY, EntityParts.HEAD_ELVIS, EntityParts.FACE_ANGY ]
		),
		Entity.create("Bob", Global.EntityType.GHOST,
			[ EntityAttributes.SMELLY ],
			[ EntityParts.BASE_COMMON, EntityParts.BOTTOM_DRESS, EntityParts.HEAD_CURLY, EntityParts.FACE_DISTRESS ]
		)
	]
)

# ______________________________________________________________________________
