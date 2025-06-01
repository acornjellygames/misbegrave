extends View

# ______________________________________________________________________________

@export var score_label: Label

# ______________________________________________________________________________

func _ready() -> void:
	score_label.set_text(str(State.total_score))

# ______________________________________________________________________________

func _on_back_button_pressed() -> void:
	State.total_score = 0
	State.level_index = 0
	State.level = null
	Global.transition_view(Views.TITLE.instantiate())
