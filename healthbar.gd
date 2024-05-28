extends Sprite2D

@onready var root = get_tree().root.get_child(0)
@onready var player = root.get_node("Area").get_node("CharacterBody2D")

func _process(delta):
	scale.x = float(player.health) / float(player.maxhp)
