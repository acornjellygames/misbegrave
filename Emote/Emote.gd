class_name Emote extends Node2D

# ______________________________________________________________________________

var texture: Texture2D

@onready var timer = $Timer
@onready var sprite = $Sprite

# ______________________________________________________________________________

static var EmoteScene = load("res://Emote/Emote.tscn")

static func create(_texture: Texture2D) -> Emote:
	var emote = EmoteScene.instantiate()
	emote.texture = _texture
	return emote

# ______________________________________________________________________________

func _ready() -> void:
	sprite.set_texture(texture)
	timer.start()

func _on_timer_timeout() -> void:
	queue_free()
