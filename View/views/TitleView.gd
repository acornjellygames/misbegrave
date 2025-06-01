extends View

# ______________________________________________________________________________

func _on_start_button_pressed() -> void:
	Global.transition_view(Views.GAME.instantiate())

func _on_credits_button_pressed() -> void:
	Global.transition_view(Views.CREDITS.instantiate())
