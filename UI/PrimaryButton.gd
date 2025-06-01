class_name PrimaryButton extends TextureButton

# ______________________________________________________________________________

@onready var text_label = $Text
@export var text: String = ""

# ______________________________________________________________________________

func _ready() -> void:
	set_text(text)
	
# ______________________________________________________________________________

func set_text(_text: String) -> void:
	text_label.set_text(_text)
