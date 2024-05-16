extends Button

@onready var root = get_tree().root.get_child(0)

@export var to = "res://Area1.tscn"
var transitioning = false

func _process(delta):
	if transitioning:
		if not root.get_node("Fade").fading:
			print("Loading")
			root.load_scene(to)
			queue_free()
			
func _on_pressed():
	if not transitioning:
		transitioning = true
		root.get_node("Fade").fadeIn()
	pass # Replace with function body.
