class_name View extends Node2D

# ______________________________________________________________________________

var content: Node = null

# ______________________________________________________________________________

static var ViewScene = load("res://View/View.tscn")

static func create(_content: Node) -> View:
	var view = ViewScene.instantiate()
	view.content = _content
	return view
	
# ______________________________________________________________________________

func _ready() -> void:
	pass

# ______________________________________________________________________________

func transition_out() -> void:
	queue_free()

func transition_in() -> void:
	pass
