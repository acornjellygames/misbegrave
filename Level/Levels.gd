extends Node

# ______________________________________________________________________________

func hole(x: int, y: int) -> Entity:
	return Entity.create("Hole", Global.EntityType.HOLE, [EntityAttributes.HOLE], [EntityParts.HOLE], Vector2i(x, y))

# ______________________________________________________________________________

var TEST = Level.new("TEST", "Test Level", Vector2i(5, 5), 
	[
		hole(2, 2),
		hole(2, 1),
		hole(2, 3),
		hole(1, 2),
		hole(3, 2),
	],[
		Entity.create("Alice", Global.EntityType.GHOST,
			[ EntityAttributes.SENSITIVE_NOSE ],
			[ EntityParts.BASE_COMMON, EntityParts.BOTTOM_BLOBBY, EntityParts.HEAD_ELVIS, EntityParts.FACE_ANGY ]
		),
		Entity.create("Bob", Global.EntityType.GHOST,
			[ EntityAttributes.SMELLY ],
			[ EntityParts.BASE_COMMON, EntityParts.BOTTOM_DRESS, EntityParts.HEAD_CURLY, EntityParts.FACE_DISTRESS ]
		),
		Entity.create("Charlie", Global.EntityType.GHOST,
			[ EntityAttributes.SENSITIVE_NOSE ],
			[ EntityParts.BASE_COMMON, EntityParts.BOTTOM_BLOBBY, EntityParts.HEAD_SIDEBUN, EntityParts.FACE_PRETTY ]
		),
		Entity.create("Daniel", Global.EntityType.GHOST,
			[ EntityAttributes.SMELLY ],
			[ EntityParts.BASE_COMMON, EntityParts.BOTTOM_DRESS, EntityParts.HEAD_WAVY, EntityParts.FACE_GLASSES ]
		)
	]
)

# ______________________________________________________________________________

var TEST2 = Level.new("TEST2", "Test Level 2", Vector2i(5, 5), 
	[
		hole(0, 0),
		hole(1, 1),
		hole(2, 2),
		hole(3, 3),
		hole(4, 4),
	],[
		Entity.create("Elizabeth", Global.EntityType.GHOST,
			[ EntityAttributes.SENSITIVE_NOSE ],
			[ EntityParts.BASE_COMMON, EntityParts.BOTTOM_DRESS, EntityParts.HEAD_ELVIS, EntityParts.FACE_ANGY ]
		),
		Entity.create("Frank", Global.EntityType.GHOST,
			[ EntityAttributes.SMELLY ],
			[ EntityParts.BASE_COMMON, EntityParts.BOTTOM_DRESS, EntityParts.HEAD_CURLY, EntityParts.FACE_DISTRESS ]
		),
		Entity.create("Grace", Global.EntityType.GHOST,
			[ EntityAttributes.SENSITIVE_NOSE ],
			[ EntityParts.BASE_COMMON, EntityParts.BOTTOM_BLOBBY, EntityParts.HEAD_SIDEBUN, EntityParts.FACE_PRETTY ]
		),
		Entity.create("Hank", Global.EntityType.GHOST,
			[ EntityAttributes.SMELLY ],
			[ EntityParts.BASE_COMMON, EntityParts.BOTTOM_BLOBBY, EntityParts.HEAD_WAVY, EntityParts.FACE_GLASSES ]
		)
	]
)

# ______________________________________________________________________________

var order = [
	TEST,
	TEST2
]
