extends Node

# ______________________________________________________________________________

var TEST = Level.new("TEST", "Test Level", Vector2i(7, 5), [
	Entity.create("Alice",
		[ EntityAttributes.SENSITIVE_NOSE ],
		[ EntityParts.TEST_BASE, EntityParts.TEST_BOTTOM, EntityParts.TEST_HEAD, EntityParts.TEST_FACE ],
		Vector2i(4, 4)
	),
	Entity.create("Bob",
		[ EntityAttributes.SMELLY ],
		[ EntityParts.TEST_BASE, EntityParts.TEST_BOTTOM, EntityParts.TEST_HEAD, EntityParts.TEST_FACE ],
		Vector2i(2, 1)
	)
])

# ______________________________________________________________________________
