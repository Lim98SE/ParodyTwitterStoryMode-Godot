extends NavigationAgent2D

@onready var root = get_tree().root.get_child(0)
@onready var player = root.get_node("Area").get_node("CharacterBody2D")
var ticks_since_last_check = 0
var ticks_between_checks = 20
var tick_variance = 3

func _process(delta):
	ticks_since_last_check += 1
	
	if ticks_since_last_check >= ticks_between_checks + randi_range(-tick_variance, tick_variance):
		target_position = player.position
		ticks_since_last_check = 0
