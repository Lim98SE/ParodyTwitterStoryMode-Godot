extends Node2D

var current_area = null
var name_tweening = false
@onready var name_label = $UI/CanvasLayer/Label
@export var buddies = ["noise", "engie"]
var battlescene = null
var fade = preload("res://Fade.tscn")
var previous
var scene = null
var last_battle = null
var player_position = null

func load_scene(arg):
	print(get_children())
	if get_node_or_null("Area") != null:
		remove_child($Area)
	
	if FileAccess.file_exists(arg):
		previous = scene
		scene = load(arg)
		add_child(scene.instantiate())
	
	else:
		print(arg, " does not exist")
	
	$Fade.fadeOut()

func back():
	if get_node_or_null("Area") != null:
		remove_child($Area)
	
	if previous != null:
		scene = previous
		add_child(scene.instantiate())
		$Fade.fadeOut()

func change_song(path):
	$Music.stop()
	$Music.currentpath = path
	$Music.stream = load(path)
	$Music.play()

func _ready():
	add_child(fade.instantiate())
	name_label.position.y = -100
	
	load_scene("res://Area1.tscn")

func done_tweening():
	name_label.get_node("Timer").start()
	name_tweening = false

func _process(delta):
	if get_node_or_null("Area") != null:
		if $Area.get_node_or_null("AreaPropreties") != null:
			if not $Fade.fading and name_label.position.y != 8 and not name_tweening and name_label.text != $Area/AreaPropreties.Name:
				name_label.text = $Area/AreaPropreties.Name
				name_tweening = true
				var tween = create_tween()
				tween.tween_property(name_label, "position", Vector2(8, 8), 1).set_trans(Tween.TRANS_QUAD)
				tween.tween_callback(done_tweening)

func _on_music_finished():
	$Music.play()
