extends Node2D

@onready var root = get_tree().root.get_child(0)
@export var to = "res://Area2.tscn"
var transitioning = false
var instant_transition = false

func _ready():
	print("TRANSITIONNNN")
	visible = false
	
	if instant_transition:
		transitioning = true
		root.get_node("Fade").fadeIn()


func _on_area_2d_area_entered(area):
	print(area)
	if area.name == "PlayerArea":
		transitioning = true
		root.get_node("Fade").fadeIn()

func _process(delta):
	if transitioning:
		if not root.get_node("Fade").fading:
			if not instant_transition:
				root.player_position = null
				root.last_battle = []
			print("Loading")
			root.load_scene(to)
			queue_free()
