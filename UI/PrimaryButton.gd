class_name PrimaryButton extends TextureButton

# ______________________________________________________________________________

@export var text: String = ""
@export var sfx: AudioStream

@onready var text_label = $Text
@onready var sfx_player = $SFXPlayer

# ______________________________________________________________________________

func _ready() -> void:
	set_text(text)
	sfx_player.set_stream(sfx)
	
# ______________________________________________________________________________

func set_text(_text: String) -> void:
	text_label.set_text(_text)

# ______________________________________________________________________________

func _on_button_down() -> void:
	sfx_player.play()
