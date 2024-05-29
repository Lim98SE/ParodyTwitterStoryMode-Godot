extends Node

@onready var root = get_tree().root.get_child(0)
@onready var player = root.get_node("Area").get_node("CharacterBody2D")

func _ready():
	player.get_node("FireCooldown").wait_time = 0.4
	player.bullets = 3
