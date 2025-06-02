extends Node

# ______________________________________________________________________________

func hole(x: int, y: int) -> Entity:
	return Entity.create("Hole", Global.EntityType.HOLE, [EntityAttributes.HOLE], [EntityParts.HOLE], [[],[],[],[]], Vector2i(x, y))
	
# ______________________________________________________________________________

var TUTORIAL_1 = func(): return Level.new("TUTORIAL_1", "Level 2", Vector2i(4, 1), 400,
	[
		hole(0, 0),
		hole(1, 0),
		hole(3, 0),
	],[
		Entity.create("Jessica", Global.EntityType.GHOST,
			[ EntityAttributes.FRIENDLY ],
			[ EntityParts.BASE_COMMON, EntityParts.BOTTOM_DRESS, EntityParts.HEAD_WAVY, EntityParts.FACE_HAPPY ],
			Global.SFX.Ghost.A
		),
		Entity.create("Elli", Global.EntityType.GHOST,
			[ EntityAttributes.FRIENDLY ],
			[ EntityParts.BASE_COMMON, EntityParts.BOTTOM_DRESS, EntityParts.HEAD_SIDEBUN, EntityParts.FACE_SPARKLE ],
			Global.SFX.Ghost.A
		),
		Entity.create("Karen", Global.EntityType.GHOST,
			[ EntityAttributes.RUDE ],
			[ EntityParts.BASE_COMMON, EntityParts.BOTTOM_BLOBBY, EntityParts.FACE_ANGY ],
			Global.SFX.Ghost.D
		),
	]
)

# ______________________________________________________________________________

var RI_1 = func(): return Level.new("RI_1", "Level 3", Vector2i(3, 1), 400,
	[
		hole(0, 0),
		hole(1, 0),
		hole(2, 0),
	],[
		Entity.create("Ri", Global.EntityType.GHOST,
			[ EntityAttributes.CRAFTS ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY, EntityParts.HEAD_SIDEBUN ],
			Global.SFX.Ghost.A
		),
		Entity.create("Soren", Global.EntityType.GHOST,
			[ EntityAttributes.QUIET ],
			[ EntityParts.BASE_COMMON,  EntityParts.BOTTOM_DRESS, EntityParts.FACE_HAPPY, EntityParts.HEAD_CURLY ],
			Global.SFX.Ghost.A
		),
		Entity.create("Fletch", Global.EntityType.GHOST,
			[ EntityAttributes.ELDERLY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ],
			Global.SFX.Ghost.B
		),
	]
)

# ______________________________________________________________________________

var RI_2 = func(): return Level.new("RI_2", "Level 5", Vector2i(3, 2), 700,
	[
		hole(0, 0),
		hole(1, 0),
		hole(1, 1),
		hole(2, 1)
	],[
		Entity.create("Julie", Global.EntityType.GHOST,
			[ EntityAttributes.FRIENDLY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_GLASSES, EntityParts.HEAD_CURLY ],
			Global.SFX.Ghost.A
		),
		Entity.create("Sam", Global.EntityType.GHOST,
			[ EntityAttributes.SOCIAL ],
			[ EntityParts.BASE_COMMON, EntityParts.BOTTOM_DRESS, EntityParts.FACE_PRETTY, EntityParts.HEAD_WAVY ],
			Global.SFX.Ghost.B
		),
		Entity.create("Erwin", Global.EntityType.GHOST,
			[ EntityAttributes.LOUD ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_GLASSES, EntityParts.HEAD_SIDEBUN ],
			Global.SFX.Ghost.C
		),
		Entity.create("Sarah", Global.EntityType.GHOST,
			[ EntityAttributes.GRUMPY ],
			[ EntityParts.BASE_COMMON, EntityParts.BOTTOM_DRESS, EntityParts.FACE_ANGY ],
			Global.SFX.Ghost.D
		),
	]
)

# ______________________________________________________________________________

var RI_3 = func(): return Level.new("RI_3", "Level 6", Vector2i(3, 3), 800,
	[
		hole(1, 0),
		hole(0, 1),
		hole(1, 1),
		hole(2, 1),
		hole(1, 2)
	],[
		Entity.create("Adam", Global.EntityType.GHOST,
			[ EntityAttributes.NERDY ],
			[ EntityParts.BASE_COMMON, EntityParts.BOTTOM_DRESS, EntityParts.FACE_GLASSES, EntityParts.HEAD_WAVY ],
			Global.SFX.Ghost.B
		),
		Entity.create("Plato", Global.EntityType.GHOST,
			[ EntityAttributes.FLIRTY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY, EntityParts.HEAD_CURLY ],
			Global.SFX.Ghost.A
		),
		Entity.create("Herbert", Global.EntityType.GHOST,
			[ EntityAttributes.SOCIAL ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_PRETTY, EntityParts.HEAD_SIDEBUN ],
			Global.SFX.Ghost.C
		),
		Entity.create("Dan", Global.EntityType.GHOST,
			[ EntityAttributes.READING ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ],
			Global.SFX.Ghost.D
		),
		Entity.create("Niko", Global.EntityType.GHOST,
			[ EntityAttributes.YOUNG ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ],
			Global.SFX.Ghost.D
		),
	]
)

# ______________________________________________________________________________

var RI_4 = func(): return Level.new("RI_4", "Level 7", Vector2i(3, 3), 700,
	[
		hole(1, 0),
		hole(2, 0),
		hole(0, 1),
		hole(1, 1),
		hole(1, 2),
		hole(2, 2),
	],[
		Entity.create("Lily", Global.EntityType.GHOST,
			[ EntityAttributes.NERDY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_GLASSES, EntityParts.HEAD_CURLY ],
			Global.SFX.Ghost.B
		),
		Entity.create("Nova", Global.EntityType.GHOST,
			[ EntityAttributes.GRUMPY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_PRETTY ]
		),
		Entity.create("Yulia", Global.EntityType.GHOST,
			[ EntityAttributes.TRADITIONAL ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY, EntityParts.HEAD_WAVY ]
		),
		Entity.create("Emery", Global.EntityType.GHOST,
			[ EntityAttributes.LOUD ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_GLASSES ],
			Global.SFX.Ghost.C
		),
		Entity.create("Ariel", Global.EntityType.GHOST,
			[ EntityAttributes.SOCIAL ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY, EntityParts.HEAD_SIDEBUN ]
		),
		Entity.create("Fable", Global.EntityType.GHOST,
			[ EntityAttributes.YOUNG ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		)
	]
)

# ______________________________________________________________________________

var RI_5 = func(): return Level.new("RI_5", "Level 8", Vector2i(3, 3), 2400,
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
		Entity.create("Lavena", Global.EntityType.GHOST,
			[ EntityAttributes.NERDY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ],
			Global.SFX.Ghost.D
		),
		Entity.create("Chris", Global.EntityType.GHOST,
			[ EntityAttributes.GRUMPY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_GLASSES, EntityParts.HEAD_CURLY ],
			Global.SFX.Ghost.B
		),
		Entity.create("Rowan", Global.EntityType.GHOST,
			[ EntityAttributes.CRAFTS ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY, EntityParts.HEAD_WAVY ],
			Global.SFX.Ghost.A
		),
		Entity.create("Acorn", Global.EntityType.GHOST,
			[ EntityAttributes.FLIRTY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_GLASSES ],
			Global.SFX.Ghost.A
		),
		Entity.create("Thierry", Global.EntityType.GHOST,
			[ EntityAttributes.READING ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_PRETTY ],
			Global.SFX.Ghost.B
		),
		Entity.create("Frog", Global.EntityType.GHOST,
			[ EntityAttributes.PUSHOVER ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY, EntityParts.HEAD_SIDEBUN ],
			Global.SFX.Ghost.C
		),
		Entity.create("Toad", Global.EntityType.GHOST,
			[ EntityAttributes.QUIET ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY, EntityParts.HEAD_WAVY ],
			Global.SFX.Ghost.C
		),
		Entity.create("Maggie", Global.EntityType.GHOST,
			[ EntityAttributes.EXTROVERT ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_GLASSES ],
			Global.SFX.Ghost.D
		),
		Entity.create("Sirete", Global.EntityType.GHOST,
			[ EntityAttributes.FRIENDLY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ],
			Global.SFX.Ghost.D
		),
	]
)

# ______________________________________________________________________________

var RI_6 = func(): return Level.new("Level 1", "Level 1", Vector2i(3, 1), 0,
	[
		hole(0, 0),
		hole(2, 0)
	],[
		Entity.create("Lune", Global.EntityType.GHOST,
			[ EntityAttributes.READING ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY, EntityParts.HEAD_WAVY ],
			Global.SFX.Ghost.B
		),
		Entity.create("Maelle", Global.EntityType.GHOST,
			[ EntityAttributes.EXTROVERT ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_GLASSES ],
			Global.SFX.Ghost.A
		)
	]
)

# ______________________________________________________________________________

var RI_7 = func(): return Level.new("RI_7", "Level 4", Vector2i(3, 2), 200,
	[
		hole(0, 0),
		hole(1, 0),
		hole(2, 1),
	],[
		Entity.create("Madeline", Global.EntityType.GHOST,
			[ EntityAttributes.SOCIAL, EntityAttributes.MUSIC ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY, EntityParts.HEAD_WAVY ],
			Global.SFX.Ghost.A
		),
		Entity.create("Gertrude", Global.EntityType.GHOST,
			[ EntityAttributes.FLIRTY, EntityAttributes.LOUD ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY, EntityParts.HEAD_SIDEBUN ],
			Global.SFX.Ghost.B
		),
		Entity.create("Cena", Global.EntityType.GHOST,
			[ EntityAttributes.RUDE ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_PRETTY ],
			Global.SFX.Ghost.C
		)
	]
)

# ______________________________________________________________________________

var RI_8 = func(): return Level.new("RI_8", "Level 9", Vector2i(3, 4), 1000,
	[
		hole(1, 0),
		hole(0, 1),
		hole(1, 1),
		hole(2, 1),
		hole(1, 2),
		hole(1, 3)
	],[
		Entity.create("Arthur", Global.EntityType.GHOST,
			[ EntityAttributes.NERDY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ],
			Global.SFX.Ghost.B
		),
		Entity.create("Benjamin", Global.EntityType.GHOST,
			[ EntityAttributes.TRADITIONAL, EntityAttributes.RUDE, EntityParts.HEAD_WAVY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ],
			Global.SFX.Ghost.B
		),
		Entity.create("Cirno", Global.EntityType.GHOST,
			[ EntityAttributes.QUIET ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY, EntityParts.HEAD_CURLY ]
		),
		Entity.create("Dave", Global.EntityType.GHOST,
			[ EntityAttributes.GRUMPY, EntityAttributes.ELDERLY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_PRETTY ],
			Global.SFX.Ghost.D
		),
		Entity.create("Emery", Global.EntityType.GHOST,
			[ EntityAttributes.YOUNG, EntityAttributes.NERDY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_GLASSES ],
			Global.SFX.Ghost.D
		)
	]
)

# ______________________________________________________________________________

var RI_9 = func(): return Level.new("RI_9", "Level 10", Vector2i(4, 4), 900,
	[
		hole(1, 0),
		hole(2, 0),
		hole(3, 0),
		hole(0, 1),
		hole(1, 2),
		hole(2, 2),
		hole(3, 3),
	],[
		Entity.create("Jane", Global.EntityType.GHOST,
			[ EntityAttributes.EXTROVERT, EntityAttributes.MUSIC ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("Danica", Global.EntityType.GHOST,
			[ EntityAttributes.GRUMPY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("Bob", Global.EntityType.GHOST,
			[ EntityAttributes.RUDE ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY, EntityParts.HEAD_WAVY ],
			Global.SFX.Ghost.B
		),
		Entity.create("Dominic", Global.EntityType.GHOST,
			[ EntityAttributes.MEDITATING, EntityAttributes.NERDY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ],
			Global.SFX.Ghost.B
		),
		Entity.create("Alana", Global.EntityType.GHOST,
			[ EntityAttributes.CRAFTS, EntityAttributes.FLIRTY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY, EntityParts.HEAD_CURLY ],
			Global.SFX.Ghost.C
		),
		Entity.create("David", Global.EntityType.GHOST,
			[ EntityAttributes.PUSHOVER ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_GLASSES ],
			Global.SFX.Ghost.C
		),
		Entity.create("Angelo", Global.EntityType.GHOST,
			[ EntityAttributes.WARM ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ],
			Global.SFX.Ghost.D
		),
	]
)

# ______________________________________________________________________________

var RI_10 = func(): return Level.new("RI_10", "Level 11", Vector2i(4, 2), 2200,
	[
		hole(1, 0),
		hole(2, 0),
		hole(3, 0),
		hole(0, 1),
		hole(1, 1),
		hole(3, 1),
	],[
		Entity.create("Camilla", Global.EntityType.GHOST,
			[ EntityAttributes.SOCIAL, EntityAttributes.NERDY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_PRETTY ]
		),
		Entity.create("Mai", Global.EntityType.GHOST,
			[ EntityAttributes.YOUNG, EntityAttributes.FRIENDLY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY, EntityParts.HEAD_WAVY ]
		),
		Entity.create("Eloi", Global.EntityType.GHOST,
			[ EntityAttributes.FLIRTY, EntityAttributes.EXTROVERT ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY, EntityParts.HEAD_CURLY ],
			Global.SFX.Ghost.B
		),
		Entity.create("Francine", Global.EntityType.GHOST,
			[ EntityAttributes.RUDE, EntityAttributes.LOUD ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
		Entity.create("Ava", Global.EntityType.GHOST,
			[ EntityAttributes.QUIET, EntityAttributes.INTROVERT ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_GLASSES ]
		),
		Entity.create("Helen", Global.EntityType.GHOST,
			[ EntityAttributes.READING ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		),
	]
)

# ______________________________________________________________________________

var RI_11 = func(): return Level.new("RI_11", "RI_11", Vector2i(1, 6), 0,
	[
		hole(0, 0),
		hole(0, 1),
		hole(0, 3),
		hole(0, 5),
	],[
		Entity.create("A", Global.EntityType.GHOST,
			[ EntityAttributes.TRADITIONAL, EntityAttributes.INTROVERT ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_PRETTY ]
		),
		Entity.create("B", Global.EntityType.GHOST,
			[ EntityAttributes.ELDERLY, EntityAttributes.MUSIC ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY, EntityParts.HEAD_WAVY ]
		),
		Entity.create("C", Global.EntityType.GHOST,
			[ EntityAttributes.RUDE, EntityAttributes.TRADITIONAL ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_GLASSES ]
		),
		Entity.create("E", Global.EntityType.GHOST,
			[ EntityAttributes.PUSHOVER, EntityAttributes.CRAFTS ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ]
		)
	]
)

# ______________________________________________________________________________

var RI_12 = func(): return Level.new("RI_12", "Level 12", Vector2i(3, 3), 1600,
	[
		hole(0, 0),
		hole(1, 0),
		hole(2, 0),
		hole(0, 1),
		hole(2, 1),
		hole(0, 2),
		hole(2, 2),
	],[
		Entity.create("Alice", Global.EntityType.GHOST,
			[ EntityAttributes.GRUMPY, EntityAttributes.MUSIC ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY, EntityParts.HEAD_WAVY ]
		),
		Entity.create("Brian", Global.EntityType.GHOST,
			[ EntityAttributes.QUIET ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY, EntityParts.HEAD_CURLY ],
			Global.SFX.Ghost.B
		),
		Entity.create("Joe", Global.EntityType.GHOST,
			[ EntityAttributes.TRADITIONAL, EntityAttributes.PUSHOVER ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ],
			Global.SFX.Ghost.C
		),
		Entity.create("Dina", Global.EntityType.GHOST,
			[ EntityAttributes.FLIRTY, EntityAttributes.FRIENDLY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ],
			Global.SFX.Ghost.D
		),
		Entity.create("Michelle", Global.EntityType.GHOST,
			[ EntityAttributes.READING ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_GLASSES ]
		),
		Entity.create("Florence", Global.EntityType.GHOST,
			[ EntityAttributes.WARM, EntityAttributes.ELDERLY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_HAPPY ],
			Global.SFX.Ghost.D
		),
		Entity.create("Will", Global.EntityType.GHOST,
			[ EntityAttributes.NERDY ],
			[ EntityParts.BASE_COMMON, EntityParts.FACE_GLASSES ],
			Global.SFX.Ghost.C
		)
	]
)

# ______________________________________________________________________________

var TEST = func(): return Level.new("TEST", "Test Level", Vector2i(5, 5), 0,
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

var TEST2 = func(): return Level.new("TEST2", "Test Level 2", Vector2i(5, 5), 0,
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
	RI_6,
	TUTORIAL_1,
	RI_1,
	RI_7,
	RI_2,
	RI_3,
	RI_4,
	RI_5,
	RI_8,
	RI_9,
	RI_10,
	RI_12
]
