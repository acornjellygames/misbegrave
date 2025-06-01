extends Node

# ______________________________________________________________________________

var HOLE = EntityAttribute.new("HOLE", "Hole", "", [], [])

# ______________________________________________________________________________

var SMELLY = EntityAttribute.new("SMELLY", "Smelly", "", [
	
], [
	
])

# ______________________________________________________________________________

var SENSITIVE_NOSE = EntityAttribute.new("SENSITIVE_NOSE", "Sensitive Nose", "", [
	
], [
	"SMELLY"
])

# ______________________________________________________________________________

var PUSHOVER = EntityAttribute.new("PUSHOVER", "Pushover", "", [
	""
], [
	"RUDE"
])

# ______________________________________________________________________________

var QUIET = EntityAttribute.new("QUIET", "Quiet", "", [
	"READING", "MEDITATING"
], [
	"LOUD", "EXTROVERT", "SOCIAL", "RUDE"
])

# ______________________________________________________________________________

var LOUD = EntityAttribute.new("LOUD", "Loud", "", [
	"MUSIC", "NERDY"
], [
	"MEDITATING", "READING", "RUDE"
])

# ______________________________________________________________________________

var WARM = EntityAttribute.new("WARM", "Warm", "", [
	"MEDITATING", "ELDERLY", "YOUNG", "INTROVERT", "READING"
], [
	"RUDE"
])

# ______________________________________________________________________________

var RUDE = EntityAttribute.new("RUDE", "Rude", "", [
	""
], [
	"PUSHOVER", "QUIET", "LOUD", "WARM", "NERDY",
	"TRADITIONAL", "INTROVERT", "EXTROVERT", "FLIRTY", "SOCIAL", "ELDERLY",
	"YOUNG", "MUSIC", "CRAFTS", "MEDITATING", "READING", "FRIENDLY", "GRUMPY", "RUDE"
])

# ______________________________________________________________________________

var NERDY = EntityAttribute.new("NERDY", "Nerdy", "", [
	"MUSIC", "CRAFTS", "QUIET"
], [
	"TRADITIONAL", "RUDE"
])

# ______________________________________________________________________________

var TRADITIONAL = EntityAttribute.new("TRADITIONAL", "Traditional", "", [
	""
], [
	"NERDY", "YOUNG", "RUDE"
])

# ______________________________________________________________________________

var FRIENDLY = EntityAttribute.new("FRIENDLY", "Friendly", "", [
	"PUSHOVER", "QUIET", "LOUD", "WARM", "NERDY",
	"TRADITIONAL", "INTROVERT", "EXTROVERT", "FLIRTY", "SOCIAL", "ELDERLY",
	"YOUNG", "MUSIC", "CRAFTS", "MEDITATING", "READING", "GRUMPY"
], [
	"RUDE"
])

# ______________________________________________________________________________

var INTROVERT = EntityAttribute.new("INTROVERT", "Introvert", "", [
	""
], [
	"EXTROVERT", "SOCIAL", "RUDE"
])

# ______________________________________________________________________________

var EXTROVERT = EntityAttribute.new("EXTROVERT", "Extrovert", "", [
	"SOCIAL", "MUSIC", "LOUD", "FLIRTY"
], [
	"RUDE"
])

# ______________________________________________________________________________

var FLIRTY = EntityAttribute.new("FLIRTY", "Flirty", "", [
	"SOCIAL"
], [
	"INTROVERT", "RUDE"
])

# ______________________________________________________________________________

var SOCIAL = EntityAttribute.new("SOCIAL", "Social", "", [
	"LOUD", "YOUNG", "MUSIC", "NERDY"
], [
	"QUIET", "INTROVERT", "RUDE"
])

# ______________________________________________________________________________

var ELDERLY = EntityAttribute.new("ELDERLY", "Elderly", "", [
	"TRADITIONAL", "WARM", "QUIET"
], [
	"LOUD", "MUSIC", "RUDE"
])

# ______________________________________________________________________________

var YOUNG = EntityAttribute.new("YOUNG", "Young", "", [
	""
], [
	"RUDE"
])

# ______________________________________________________________________________

var MUSIC = EntityAttribute.new("MUSIC", "Music", "", [
	""
], [
	"RUDE"
])

# ______________________________________________________________________________

var CRAFTS = EntityAttribute.new("CRAFTS", "Crafts", "", [
	"NERDY"
], [
	"RUDE"
])

# ______________________________________________________________________________

var MEDITATING = EntityAttribute.new("MEDITATING", "Meditating", "", [
	""
], [
	"RUDE"
])

# ______________________________________________________________________________

var READING = EntityAttribute.new("READING", "Reading", "", [
	""
], [
	"RUDE"
])

# ______________________________________________________________________________

var GRUMPY = EntityAttribute.new("GRUMPY", "Grumpy", "", [
	"PUSHOVER", "TRADITIONAL", "QUIET"
], [
	"LOUD", "SOCIAL", "RUDE"
])

# ______________________________________________________________________________
