extends Node

@onready var root = get_tree().root.get_child(0)
@onready var player = root.get_node("Area").get_node("CharacterBody2D")

func _ready():
	player.maxhp = 125
	player.health = 125
	player.get_node("FireCooldown").wait_time = 0.4
