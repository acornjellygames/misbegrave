extends View

@onready var splash_screen: TextureRect = $Splash
@onready var splash_timer: Timer = $Splash/SplashTimer

# ______________________________________________________________________________

func _ready() -> void:
	if (State.has_seen_splash_screen):
		splash_screen.set_visible(false)
	Global.play_bgm(Global.BGM.THEME)
	
func transition_out_splash_screen() -> void:
	var tween = create_tween()
	tween.tween_property(splash_screen, "self_modulate", Color(1, 1, 1, 0), .5)
	tween.set_trans(Tween.TRANS_EXPO)
	tween.tween_callback(func(): 
		splash_screen.queue_free()
		State.has_seen_splash_screen = true
	)
	tween.play()	

# ______________________________________________________________________________

func _on_start_button_pressed() -> void:
	Global.transition_view(Views.GAME.instantiate())

func _on_credits_button_pressed() -> void:
	Global.transition_view(Views.CREDITS.instantiate())
