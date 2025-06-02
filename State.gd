extends Node

var view_container: Node = null
var view: View = null
var level: Level = null
var level_index: int = 0
var score: int = 0
var total_score: int = 0
var pairs: Array[EntityAttributePair]
var has_seen_splash_screen: bool = false
var last_active_ghost: Entity = null
