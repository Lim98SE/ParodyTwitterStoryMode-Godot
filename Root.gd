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

func _process(delta):
	if not $Fade.fading:
		var tween = create_tween()
