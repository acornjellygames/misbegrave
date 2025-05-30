extends View

# ______________________________________________________________________________

func _on_button_pressed() -> void:
	Global.transition_view(Views.GAME.instantiate())
