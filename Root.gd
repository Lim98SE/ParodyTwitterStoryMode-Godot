extends Node2D

var current_area = null
var name_tweening = false
@onready var name_label = $UI/CanvasLayer/Label

func load_scene(arg):
	if get_node_or_null("Area") != null:
		remove_child($Area)
	
	if FileAccess.file_exists(arg):
		var scene = load(arg)
		add_child(scene.instantiate())
	
	else:
		print(arg, " does not exist")
	
	$Fade.fadeOut()

func _ready():
	name_label.position.y = -100
	load_scene("res://Area1.tscn")

func done_tweening():
	name_label.get_node("Timer").start()
	name_tweening = false

func _process(delta):
	if not $Fade.fading and name_label.position.y != 8 and not name_tweening and name_label.text != $Area/AreaPropreties.Name:
		name_label.text = $Area/AreaPropreties.Name
		name_tweening = true
		var tween = create_tween()
		tween.tween_property(name_label, "position", Vector2(8, 8), 1).set_trans(Tween.TRANS_QUAD)
		tween.tween_callback(done_tweening)
