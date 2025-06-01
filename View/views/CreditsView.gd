extends View

# ______________________________________________________________________________

func _on_back_button_pressed() -> void:
	Global.transition_view(Views.TITLE.instantiate())
