extends Node

# ______________________________________________________________________________

func hole(x: int, y: int) -> Entity:
	return Entity.create("Hole", Global.EntityType.HOLE, [EntityAttributes.HOLE], [EntityParts.HOLE], Vector2i(x, y))
	
# ______________________________________________________________________________

var TUTORIAL_1 = func(): return Level.new("TUTORIAL_1", "First Steps", Vector2i(4, 1), 
	[
		hole(0, 0),
		hole(1, 0),
		hole(3, 0),
	],[
		Entity.create("Jessica", Global.EntityType.GHOST,
			[ EntityAttributes.FRIENDLY ],
			[ EntityParts.BASE_COMMON, EntityParts.BOTTOM_DRESS, EntityParts.HEAD_WAVY, EntityParts.FACE_HAPPY ]
		),
		Entity.create("Elli", Global.EntityType.GHOST,
			[ EntityAttributes.FRIENDLY ],
			[ EntityParts.BASE_COMMON, EntityParts.BOTTOM_DRESS, EntityParts.HEAD_SIDEBUN, EntityParts.FACE_SPARKLE ]
		),
		Entity.create("Meanie", Global.EntityType.GHOST,
			[ EntityAttributes.RUDE ],
			[ EntityParts.BASE_COMMON, EntityParts.BOTTOM_BLOBBY, EntityParts.FACE_ANGY ]
		),
	]
)

# ______________________________________________________________________________

var RI_1 = func(): return Level.new("RI_1", "RI_1", Vector2i(3, 1), 
	[
		hole(0, 0),
		hole(1, 0),
		hole(2, 0),
	],[
		Entity.create("Ri", Global.EntityType.GHOST,
			[ EntityAttributes.CRAFTS ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("Soren", Global.EntityType.GHOST,
			[ EntityAttributes.QUIET ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("Fletch", Global.EntityType.GHOST,
			[ EntityAttributes.ELDERLY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
	]
)

# ______________________________________________________________________________

var RI_2 = func(): return Level.new("RI_2", "RI_2", Vector2i(3, 2), 
	[
		hole(0, 0),
		hole(1, 0),
		hole(1, 1),
		hole(2, 1)
	],[
		Entity.create("1", Global.EntityType.GHOST,
			[ EntityAttributes.FRIENDLY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("2", Global.EntityType.GHOST,
			[ EntityAttributes.SOCIAL ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("3", Global.EntityType.GHOST,
			[ EntityAttributes.LOUD ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("4", Global.EntityType.GHOST,
			[ EntityAttributes.GRUMPY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
	]
)

# ______________________________________________________________________________

var RI_3 = func(): return Level.new("RI_3", "RI_3", Vector2i(3, 3), 
	[
		hole(1, 0),
		hole(0, 1),
		hole(1, 1),
		hole(2, 1),
		hole(1, 2)
	],[
		Entity.create("1", Global.EntityType.GHOST,
			[ EntityAttributes.NERDY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("2", Global.EntityType.GHOST,
			[ EntityAttributes.FLIRTY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("3", Global.EntityType.GHOST,
			[ EntityAttributes.SOCIAL ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("4", Global.EntityType.GHOST,
			[ EntityAttributes.READING ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("5", Global.EntityType.GHOST,
			[ EntityAttributes.YOUNG ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
	]
)

# ______________________________________________________________________________

var RI_4 = func(): return Level.new("RI_4", "RI_4", Vector2i(3, 3), 
	[
		hole(1, 0),
		hole(2, 0),
		hole(0, 1),
		hole(1, 1),
		hole(1, 2),
		hole(2, 2),
	],[
		Entity.create("1", Global.EntityType.GHOST,
			[ EntityAttributes.NERDY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("2", Global.EntityType.GHOST,
			[ EntityAttributes.GRUMPY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("3", Global.EntityType.GHOST,
			[ EntityAttributes.TRADITIONAL ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("4", Global.EntityType.GHOST,
			[ EntityAttributes.LOUD ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("5", Global.EntityType.GHOST,
			[ EntityAttributes.SOCIAL ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("6", Global.EntityType.GHOST,
			[ EntityAttributes.YOUNG ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		)
	]
)

# ______________________________________________________________________________

var RI_5 = func(): return Level.new("RI_5", "RI_5", Vector2i(3, 3), 
	[
		hole(0, 0),
		hole(1, 0),
		hole(2, 0),
		hole(0, 1),
		hole(1, 1),
		hole(2, 1),
		hole(0, 2),
		hole(1, 2),
		hole(2, 2),
	],[
		Entity.create("1", Global.EntityType.GHOST,
			[ EntityAttributes.NERDY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("2", Global.EntityType.GHOST,
			[ EntityAttributes.GRUMPY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("3", Global.EntityType.GHOST,
			[ EntityAttributes.CRAFTS ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("4", Global.EntityType.GHOST,
			[ EntityAttributes.FLIRTY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("5", Global.EntityType.GHOST,
			[ EntityAttributes.READING ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("6", Global.EntityType.GHOST,
			[ EntityAttributes.PUSHOVER ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("7", Global.EntityType.GHOST,
			[ EntityAttributes.QUIET ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("8", Global.EntityType.GHOST,
			[ EntityAttributes.EXTROVERT ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("9", Global.EntityType.GHOST,
			[ EntityAttributes.FRIENDLY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
	]
)

# ______________________________________________________________________________

var TEST = func(): return Level.new("TEST", "Test Level", Vector2i(5, 5), 
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

var TEST2 = func(): return Level.new("TEST2", "Test Level 2", Vector2i(5, 5), 
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
	TUTORIAL_1,
	RI_1,
	RI_2,
	RI_3,
	RI_4,
	RI_5,
	TEST,
	TEST2
]
