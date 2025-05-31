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

# var TRAIT_ID = EntityAttribute.new("TRAIT_ID", "Name of trait in proper case", "Leave this blank", [ "ARRAY", "OF", "FAVOURABLE", TRAIT", "IDS" ], [ "ARRAY", "OF", "UNFAVOURABLE", TRAIT", "IDS" ])
var EXTROVERTED = EntityAttribute.new("EXTROVERTED", "Extroverted", "", [
	"TALKATIVE", "HYPER"
], [
	"QUIET", "LOW ENERGY"
])
