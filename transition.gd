extends Node2D

@onready var root = get_tree().root.get_child(0)
@export var to = "res://Area2.tscn"
var transitioning = false

func _ready():
	visible = false

func _on_area_2d_area_entered(area):
	if area.name == "PlayerArea":
		transitioning = true
		root.get_node("Fade").fadeIn()

func _process(delta):
	if transitioning:
		if not root.get_node("Fade").fading:
			print("Loading")
			root.load_scene(to)
			queue_free()
	
	if Input.is_action_just_pressed("debug") and not transitioning:
		to = "res://Battle.tscn"
		transitioning = true
		root.get_node("Fade").fadeIn()
