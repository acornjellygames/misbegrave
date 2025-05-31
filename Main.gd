# CHICKEN JOCKEY
extends Node2D

# ______________________________________________________________________________

@onready var view_container = $ViewContainer

# ______________________________________________________________________________

func _ready() -> void:
	State.view_container = view_container
	Global.transition_view(Views.TITLE.instantiate())
	
