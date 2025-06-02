extends Node

var bgm_player: AudioStreamPlayer

# ______________________________________________________________________________

const TILE_SIZE = 200
const LIKE_POINTS = 2
const HATE_POINTS = -1
const POINTS_MULTIPLIER = 100
const VIEW_TRANSITION_TIME_SEC = 0.5
const BOARD_CONTAINER_SIZE = Vector2i(1416, 1080)
const EMOTE_DURATION_SEC = 2.5
const RESERVE_MARGIN = Vector2(32, 0)
const DECO_COUNT_MIN = 10
const DECO_COUNT_MAX = 20

# ______________________________________________________________________________

enum EntityType {
	GHOST,
	HOLE,
	PROP,
}

enum EntityPartType {
	BASE,
	BOTTOM,
	HEAD,
	FACE,
	MISC
}

# ______________________________________________________________________________

var DECOS = [
	preload("res://assets/adornment/grass-1.png"),
	preload("res://assets/adornment/grass-2.png"),
	preload("res://assets/adornment/grass-3.png"),
	preload("res://assets/adornment/grass-4.png"),
	preload("res://assets/adornment/grass-5.png")
]

var HEADSTONES = [
	preload("res://assets/headstone/headstone-1.png"),
	preload("res://assets/headstone/headstone-2.png")
]

# ______________________________________________________________________________

var BGM = {
	THEME = preload("res://assets/music/theme.mp3"),
	THEME_LIGHT = preload("res://assets/music/theme-light.mp3"),
	AMBIENCE = preload("res://assets/music/ambience.mp3")
}

var SFX = {
	CLICK = preload("res://assets/sfx/click.wav"),
	DIG = preload("res://assets/sfx/dig.wav"),
	Ghost = {
		A = [ # [HELLO], [SELECT], [GOOD], [BAD]
			[
				preload("res://assets/sfx/ghost/1/Ghost1 8-Hello.wav"),
				preload("res://assets/sfx/ghost/1/Ghost1 5-Wooooooo.wav"),
				preload("res://assets/sfx/ghost/1/Ghost1 9-SoftWooooo.wav"),
			], [
				preload("res://assets/sfx/ghost/1/Ghost1 11-Quickboo.wav"),
				preload("res://assets/sfx/ghost/1/Ghost1 12-Quickwoo.wav")
			], [
				preload("res://assets/sfx/ghost/1/Ghost1 2-ContentedBooWoo.wav"),
				preload("res://assets/sfx/ghost/1/Ghost1 4-HappyWoo.wav"),
				preload("res://assets/sfx/ghost/1/Ghost1 6-ContentedWoo.wav"),
				preload("res://assets/sfx/ghost/1/Ghost1 10-Happy BooWoo.wav")
			], [
				preload("res://assets/sfx/ghost/1/Ghost1 1-GrumpyBoo.wav"),
				preload("res://assets/sfx/ghost/1/Ghost1 7-Angry.wav")
			]
		],
		B = [ # [HELLO], [SELECT], [GOOD], [BAD]
			[
				preload("res://assets/sfx/ghost/2/Hello.mp3"),
				preload("res://assets/sfx/ghost/2/Neutral Woo.mp3")
			], [
				preload("res://assets/sfx/ghost/2/Boo.mp3")
			], [
				preload("res://assets/sfx/ghost/2/Happy ghost.mp3")
			], [
				preload("res://assets/sfx/ghost/2/Angry Ghost 1.mp3"),
				preload("res://assets/sfx/ghost/2/Angry ghost 2.mp3")
			]
		],
		C = [ # [HELLO], [SELECT], [GOOD], [BAD]
			[
				preload("res://assets/sfx/ghost/3/Hello 1.wav"),
				preload("res://assets/sfx/ghost/3/Hello 2.wav"),
				preload("res://assets/sfx/ghost/3/Neutral Ghost.wav")
			], [
				preload("res://assets/sfx/ghost/3/Boo 1.wav"),
				preload("res://assets/sfx/ghost/3/Boo 2.wav")
			], [
				preload("res://assets/sfx/ghost/3/Contented Ghost 1.wav"),
				preload("res://assets/sfx/ghost/3/Contented Ghost 2.wav"),
				preload("res://assets/sfx/ghost/3/Contented Ghost 3.wav")
			], [
				preload("res://assets/sfx/ghost/3/Negative Ghost 1.wav"),
				preload("res://assets/sfx/ghost/3/Negative Ghost 2.wav"),
				preload("res://assets/sfx/ghost/3/Negative Ghost 3.wav"),
			]
		],
		D = [ # [HELLO], [SELECT], [GOOD], [BAD]
			[
				preload("res://assets/sfx/ghost/4/Ghost4-Hello.mp3"),
				preload("res://assets/sfx/ghost/4/Ghost4-Woo-boo.mp3")
			], [
				preload("res://assets/sfx/ghost/4/Ghost4-Disgruntled_.mp3")
			], [
				preload("res://assets/sfx/ghost/4/Ghost4-Happy.mp3")
			], [
				preload("res://assets/sfx/ghost/4/Ghost4-Mad woo.mp3")
			]
		],
	}
}

# ______________________________________________________________________________

var rng: RandomNumberGenerator

# ______________________________________________________________________________

func create_2d_array(dimensions: Vector2i, fill: Variant = null) -> Array[Array]:
	var array: Array[Array] = []
	for x in range(dimensions.x):
		var column = []
		for y in range(dimensions.y):
			column.append(fill) 
		array.append(column)
	return array

# ______________________________________________________________________________

func transition_view(new_view: View) -> void:
	var old_view = State.view
	State.view = new_view
	State.view_container.add_child(new_view)
	new_view.transition_in()
	if (old_view != null): old_view.transition_out()
	
# ______________________________________________________________________________

func play_bgm(stream: AudioStream) -> void:
	if (stream == bgm_player.get_stream()): return
	bgm_player.stop()
	bgm_player.set_stream(stream)
	bgm_player.play()
	
# ______________________________________________________________________________

func delay(callback: Callable, sec: float) -> void:
	var timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", callback)
	timer.connect("timeout", timer.queue_free)
	timer.start(sec)

# ______________________________________________________________________________

func _ready() -> void:
	rng = RandomNumberGenerator.new()
	rng.randomize()
	bgm_player = AudioStreamPlayer.new()
	add_child(bgm_player)
